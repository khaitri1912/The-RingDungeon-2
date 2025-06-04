using UnityEngine;
using UnityEngine.AI;

public class InteractionHandler : MonoBehaviour
{
    [Header("Attack Settings")]
    [SerializeField] Animator animator;
    [SerializeField] ParticleSystem hitEffect;
    [SerializeField] float attackSpeed = 1.5f;
    [SerializeField] float attackDelay = 0.3f;
    [SerializeField] float attackDistance = 1.5f;
    [SerializeField] int attackDamage = 1;

    // sound effect on hit
    [SerializeField] private AudioClip swordHitSound;
    [SerializeField] private AudioClip axeHitSound;
    [SerializeField] private AudioClip fistHitSound;
    [SerializeField] private AudioSource audioSource;

    // animation combo
    private int comboStep = 0; // combo hi?n t?i: 0-1-2
    private float comboResetTime = 2f; // th?i gian t?i ?a gi?a 2 ?òn combo
    private float lastAttackTime = 0f;


    Interactable currentTarget;
    bool playerBusy;
    public bool IsBusy => playerBusy;

    public Interactable CurrentTarget => currentTarget;
    public float AttackDistance => attackDistance;
    public void SetTarget(Interactable target)
    {
        currentTarget = target;
    }

    public void TryInteract(NavMeshAgent agent, System.Action onDone)
    {
        if (currentTarget == null) return;

        float distance = Vector3.Distance(agent.transform.position, currentTarget.transform.position);
        if (distance > attackDistance)
        {
            agent.SetDestination(currentTarget.transform.position);
            return;
        }

        agent.SetDestination(agent.transform.position); // d?ng l?i

        if (playerBusy) return;
        playerBusy = true;

        switch (currentTarget.interactionType)
        {
            case InteractableType.Enemy:
                if (Time.time - lastAttackTime > comboResetTime)
                {
                    comboStep = 0; // reset combo n?u b?m quá ch?m
                }

                animator.Play($"Attack_{comboStep + 1}"); // ví d? Attack_1, Attack_2, Attack_3

                Invoke(nameof(SendAttack), attackDelay);
                Invoke(nameof(Done), attackSpeed);

                lastAttackTime = Time.time;

                comboStep = (comboStep + 1) % 3; // chuy?n combo (vòng 1 ? 2 ? 3 ? 1 ...)
                break;

            case InteractableType.Item:
                animator.Play("Pickup");
                currentTarget.InteractWithItem();
                Invoke(nameof(Done), 0.5f);
                break;
        }
    }

    void SendAttack()
    {
        if (currentTarget == null || currentTarget.myActor == null) return;
        if (currentTarget.myActor.currentHealth <= 0) return;

        Instantiate(hitEffect, currentTarget.transform.position + Vector3.up, Quaternion.identity);
        if (audioSource != null)
        {
            string currentWeapon = SwapWeapon.Instance?.GetCurrentWeapon();

            switch (currentWeapon)
            {
                case "Sword":
                    audioSource.PlayOneShot(swordHitSound);
                    break;
                case "Axe":
                    audioSource.PlayOneShot(axeHitSound);
                    break;
                default:
                    audioSource.PlayOneShot(fistHitSound);
                    break;
            }
        }
        currentTarget.myActor.TakeDame(attackDamage);
    }

    void Done()
    {
        playerBusy = false;
        currentTarget = null;
    }

    public Interactable GetCurrentTarget()
    {
        return currentTarget;
    }
    public void ReachDistance(NavMeshAgent agent, System.Action onDone)
    {
        TryInteract(agent, onDone);
    }
}
