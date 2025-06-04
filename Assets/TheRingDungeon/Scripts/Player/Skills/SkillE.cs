using UnityEngine;

public class SkillE : SkillBase
{
    public GameObject conePrefab;

    public override void Execute(Vector3 targetPosition, Quaternion rotation)
    {
        Vector3 spawnPos = transform.position + rotation * Vector3.forward * 1.5f;
        Instantiate(conePrefab, spawnPos, rotation);
    }
}
