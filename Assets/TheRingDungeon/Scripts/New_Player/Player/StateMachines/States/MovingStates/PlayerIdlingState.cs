using UnityEngine;

public class PlayerIdlingState : PlayerStates
{
    public PlayerIdlingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
    {

    }

    public override void Enter()
    {
        base.Enter();

        speedModifier = 0f;

        ResetVelocity();
    }

    public override void Update()
    {
        base.Update();

        if (movementInput == Vector2.zero)
        {
            return;
        }

        OnMove();
    }

    private void OnMove()
    {
        stateMachine.ChangeState(stateMachine.RunningState);
    }
}
