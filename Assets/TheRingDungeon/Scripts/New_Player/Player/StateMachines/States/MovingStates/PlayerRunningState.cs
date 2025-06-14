using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerRunningState : PlayerStates
{
    public PlayerRunningState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
    {

    }

    public override void Enter()
    {
        base.Enter();

        speedModifier = 1f;
    }

    #region Reusable Methods
    protected override void AddInputActionsCallBack()
    {
        base.AddInputActionsCallBack();

        stateMachine.Player.Inputs.playerActions.Movement.canceled += OnMovementCanceled;
    }

    protected override void RemoveInputActionsCallBack()
    {
        stateMachine.Player.Inputs.playerActions.Movement.canceled -= OnMovementCanceled;
    }
    #endregion

    #region Input Methods
    protected void OnMovementCanceled(InputAction.CallbackContext context)
    {
        stateMachine.ChangeState(stateMachine.IdlingState);
    }
    #endregion
}
