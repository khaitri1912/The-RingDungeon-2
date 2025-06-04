using UnityEngine;

public class SkillW : SkillBase
{
    public GameObject aoePrefab;

    public override void Execute(Vector3 targetPosition, Quaternion rotation)
    {
        Instantiate(aoePrefab, targetPosition, Quaternion.identity);
    }
}
