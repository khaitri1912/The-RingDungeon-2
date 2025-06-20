using System;
using UnityEngine;

[Serializable]
public class PlayerAnimationData
{
    [Header("State Group Parameter Names")]
    [field: SerializeField] private string movingParameterName = "Moving";
    [field: SerializeField] private string stoppingParameterName = "Stopping";

    [Header("Details Parameter Names")]
    [field: SerializeField] private string idleParameterName = "isIdling";
    [field: SerializeField] private string dashParameterName = "isDashing";
    [field: SerializeField] private string hardStopParameterName = "isHardStopping";

    public int MovingParameterHash { get; private set; }
    public int StoppingParameterHash { get; private set; }

    public int IdleParameterHash { get; private set; }
    public int DashParameterHash { get; private set; }
    public int HardStopParameterHash { get; private set; }

    public void Initialize()
    {
        MovingParameterHash = Animator.StringToHash(movingParameterName);
        StoppingParameterHash = Animator.StringToHash(stoppingParameterName);

        IdleParameterHash = Animator.StringToHash(idleParameterName);
        DashParameterHash = Animator.StringToHash(dashParameterName);
        HardStopParameterHash = Animator.StringToHash(hardStopParameterName);
    }
}
