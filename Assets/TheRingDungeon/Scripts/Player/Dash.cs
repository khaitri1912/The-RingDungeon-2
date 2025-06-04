using UnityEngine;
using UnityEngine.AI;

public class Dash : MonoBehaviour
{
    [SerializeField] float dashDistance = 5f;
    [SerializeField] float dashCooldown = 1f;

    [SerializeField] TrailRenderer trail;

    private StaminaSystem stamina;
    NavMeshAgent agent;
    float lastDashTime = -999f;

    void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        stamina = GetComponent<StaminaSystem>();

        trail.emitting = false;
    }

    public void TryDash()
    {
        if (!stamina.CanDash()) return;
        if (Time.time - lastDashTime < dashCooldown) return;

        Vector3 dashDir = agent.velocity.normalized;
        if (dashDir == Vector3.zero) return;

        stamina.UseStamina();

        trail.emitting = true;

        agent.isStopped = true;
        transform.position += dashDir * dashDistance;

        agent.ResetPath();

        lastDashTime = Time.time;

        StartCoroutine(ReEnableAgent());

        Invoke("StopTrail", 0.25f);
    }

    System.Collections.IEnumerator ReEnableAgent()
    {
        yield return null;
        agent.isStopped = false;
    }

    void StopTrail()
    {
        trail.emitting = false;
    }
}

