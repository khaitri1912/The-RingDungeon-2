using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerDashingState : PlayerStates
{
    public PlayerDashingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
    {

    }

    public override void Enter()
    {
        base.Enter();

        speedModifier = 3f;

        AddForceOnTransitionFromStationaryState();
    }

    public override void OnAnimationTransitionEvent()
    {
        if (movementInput == Vector2.zero)
        {
            stateMachine.ChangeState(stateMachine.HardStoppingState); 
            return;
        }
    }

    private void AddForceOnTransitionFromStationaryState()
    {
        if (movementInput != Vector2.zero)
        {
            return;
        }

        Vector3 characterRotationDirection = -stateMachine.Player.transform.forward;
        characterRotationDirection.y = 0f;

        stateMachine.Player.Rigidbody.linearVelocity = characterRotationDirection * GetMovementSpeed();
    }

    #region Input Methods

    protected override void OnDashStarted(InputAction.CallbackContext context)
    {
        
    }
    #endregion
}
