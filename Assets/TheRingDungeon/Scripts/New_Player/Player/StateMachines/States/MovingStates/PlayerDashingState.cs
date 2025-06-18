using System;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerDashingState : PlayerGroundedState
{
    private PlayerDashData _dashData;

    private bool shouldKeepRotating;
    public PlayerDashingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
    {
        _dashData = movementData.DashData;
    }

    public override void Enter()
    {
        base.Enter();

        stateMachine.ReusableData.MovementSpeedModifier = _dashData.SpeedModifier;

        AddForceOnTransitionFromStationaryState();

        shouldKeepRotating = stateMachine.ReusableData.MovementInput != Vector2.zero;
    }

    public override void OnAnimationTransitionEvent()
    {
        if (stateMachine.ReusableData.MovementInput == Vector2.zero)
        {
            stateMachine.ChangeState(stateMachine.HardStoppingState); 
            return;
        }
    }

    private void AddForceOnTransitionFromStationaryState()
    {
        if (stateMachine.ReusableData.MovementInput != Vector2.zero)
        {
            return;
        }

        Vector3 characterRotationDirection = -stateMachine.Player.transform.forward;
        characterRotationDirection.y = 0f;

        stateMachine.Player.Rigidbody.linearVelocity = characterRotationDirection * GetMovementSpeed();
    }

    protected override void AddInputActionsCallBack()
    {
        base.AddInputActionsCallBack();

        stateMachine.Player.Inputs.playerActions.Movement.performed += OnMovementPerformed;
    }

    protected override void RemoveInputActionsCallBack()
    {
        base.RemoveInputActionsCallBack();

        stateMachine.Player.Inputs.playerActions.Movement.performed -= OnMovementPerformed;
    }


    #region Input Methods
    private void OnMovementPerformed(InputAction.CallbackContext context)
    {
        shouldKeepRotating = true;
    }

    protected override void OnMovementCanceled(InputAction.CallbackContext context)
    {
        
    }

    protected override void OnDashStarted(InputAction.CallbackContext context)
    {
        
    }
    #endregion
}
