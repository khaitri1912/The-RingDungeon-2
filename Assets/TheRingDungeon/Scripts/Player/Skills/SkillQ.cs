using UnityEngine;

public class SkillQ : SkillBase
{
    public GameObject projectilePrefab;
    public float projectileSpeed = 10f; // t?c ?? bay

    public override void Execute(Vector3 startPosition, Quaternion rotation)
    {
        // 1. T?o ra projectile t?i tay v� h??ng v? chu?t
        GameObject projectile = GameObject.Instantiate(projectilePrefab, startPosition, rotation);

        // 2. T�m Rigidbody ?? ??y vi�n ??n bay theo h??ng
        Rigidbody rb = projectile.GetComponent<Rigidbody>();
        if (rb != null)
        {
            rb.linearVelocity = rotation * Vector3.forward * projectileSpeed;
        }

        GameObject.Destroy(projectile, 2f);
    }
}
