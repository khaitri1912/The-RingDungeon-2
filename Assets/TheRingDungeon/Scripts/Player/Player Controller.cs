using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.AI;

public class PlayerController : MonoBehaviour
{
    const string IDLE = "Idle";
    const string WALK = "Walk";
    const string ATTACK_1 = "Attack_1";
    const string ATTACK_2 = "Attack_2";
    const string ATTACK_3 = "Attack_3";

    const string PICKUP = "Pickup";

    CustomActions input;

    NavMeshAgent agent;
    Animator animator;

    [Header("Movement")]
    [SerializeField] ParticleSystem clickEffect;
    [SerializeField] LayerMask clickableLayer;

    float lookRotaionSpeed = 8f;

    [SerializeField] InteractionHandler interactionHandler;
    Interactable target;

    // sound system
    [SerializeField] private AudioSource audioSource;
    [SerializeField] private AudioClip footstepClip;
    [SerializeField] private float stepRate = 0.5f;
    private float stepTimer = 0f;


    //Dash
    Dash dash;

    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        animator = GetComponent<Animator>();

        input = new CustomActions();
        AssignInputs();

        dash = GetComponent<Dash>();
        interactionHandler = GetComponent<InteractionHandler>();

    }

    void AssignInputs()
    {
        input.Main.Move.performed += ctx => ClickToMove();
        input.Main.Dash.performed += ctx => dash.TryDash();

    }

    void ClickToMove()
    {
        RaycastHit hit;
        if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit, 100, clickableLayer))
        {
            if (hit.transform.CompareTag("Interactable"))
            {
                target = hit.transform.GetComponent<Interactable>();
                interactionHandler.SetTarget(target);
                if (clickEffect != null)
                {
                    Instantiate(clickEffect, hit.point += new Vector3(0, 0.1f, 0), clickEffect.transform.rotation);
                }
            }
            else
            {
                target = null;

                agent.destination = hit.point;
                if (clickEffect != null)
                {
                    Instantiate(clickEffect, hit.point += new Vector3(0, 0.1f, 0), clickEffect.transform.rotation);
                }
            }
        }
    }

    private void OnEnable()
    {
        input.Enable();
    }

    private void OnDisable()
    {
        input.Disable();
    }

    private void Update()
    {
        FollowTarget();
        FaceTarget();
        if (!interactionHandler.IsBusy)
            SetAnimations();

        if (agent.velocity.magnitude > 0.2f && agent.remainingDistance > 0.1f)
        {
            stepTimer -= Time.deltaTime;
            if (stepTimer <= 0f)
            {
                audioSource.PlayOneShot(footstepClip);
                stepTimer = stepRate;
            }
        }
        else
        {
            stepTimer = 0f;
        }
    }

    void FollowTarget()
    {
        var currentTarget = interactionHandler.CurrentTarget;
        if (currentTarget == null) return;

        if (Vector3.Distance(currentTarget.transform.position, transform.position) <= interactionHandler.AttackDistance)
        {
            agent.SetDestination(transform.position);
            interactionHandler.ReachDistance(agent, () => {
                // Callback khi xong hành ??ng (n?u b?n c?n làm gì thêm sau khi nh?t item / ?ánh xong)
            });
        }
        else
        {
            agent.SetDestination(currentTarget.transform.position);
        }
    }

    void FaceTarget()
    {
        if (agent.destination == transform.position) return;

        Vector3 facing = agent.destination;

        if (interactionHandler.IsBusy)
        {
            var currentTarget = interactionHandler.GetCurrentTarget();
            if (currentTarget != null)
            {
                facing = currentTarget.transform.position;
            }
        }

        if (!agent.pathPending && agent.remainingDistance > agent.stoppingDistance)
        {
            Vector3 direction = (facing - transform.position).normalized;
            Quaternion lookRotation = Quaternion.LookRotation(new Vector3(direction.x, 0, direction.z));
            transform.rotation = Quaternion.Slerp(transform.rotation, lookRotation, Time.deltaTime * lookRotaionSpeed);
        }
    }

    void SetAnimations()
    {
        if (interactionHandler.IsBusy) return;
        if (agent.velocity == Vector3.zero)
        {
            animator.Play(IDLE);
        }
        else
        {
            animator.Play(WALK);
        }
    }
}
