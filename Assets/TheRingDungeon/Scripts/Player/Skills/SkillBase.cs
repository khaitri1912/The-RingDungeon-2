using UnityEngine;

public abstract class SkillBase : MonoBehaviour
{
    public abstract void Execute(Vector3 targetPosition, Quaternion rotation);
}
