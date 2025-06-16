using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerStates : IState
{
    protected PlayerStateMachine stateMachine;

    public Vector2 movementInput;
    public bool mouseClick;

    protected float baseSpeed = 5f;
    protected float speedModifier = 1f;
    protected float rotationSpeed = 1000f;

    public float movementDecelerationForce;

    public PlayerStates(PlayerStateMachine playerStateMachine)
    {
        stateMachine = playerStateMachine;
    }

    #region IState Methods
    public virtual void Enter()
    {
        Debug.Log("State: " + GetType().Name);

        AddInputActionsCallBack();
    }

    public virtual void Exit()
    {
        RemoveInputActionsCallBack();
    }

    public virtual void HandleInput()
    {
        ReadMovementInput();
    }

    public virtual void PhysicsUpdate()
    {
        Move();
    }

    public virtual void Update()
    {
        
    }

    public virtual void OnAnimationEnterEvent()
    {
        
    }

    public virtual void OnAnimationExitEvent()
    {
        
    }

    public virtual void OnAnimationTransitionEvent()
    {
        
    }
    #endregion

    #region Main Methods
    private void ReadMovementInput()
    {
        movementInput = stateMachine.Player.Inputs.playerActions.Movement.ReadValue<Vector2>();

    }

    private void Move()
    {
        if (movementInput == Vector2.zero || speedModifier == 0f)
        {
            return;
        }

        Vector3 moveDirection = GetMovementDirection();

        float moveSpeed = GetMovementSpeed();

        Vector3 currentHorizontalVelocity = GetPlayerHorizontalVelocity();

        Quaternion towardRotation = GetPlayerRotation(moveDirection);

        stateMachine.Player.Rigidbody.AddForce(moveSpeed * 1f * moveDirection - currentHorizontalVelocity, ForceMode.VelocityChange);

        stateMachine.Player.transform.rotation = Quaternion.RotateTowards(stateMachine.Player.transform.rotation, towardRotation, rotationSpeed * Time.deltaTime);
    }

    protected Vector3 GetMovementDirection()
    {
        return new Vector3(movementInput.x, 0f, movementInput.y);   
    }

    protected float GetMovementSpeed()
    {
        return baseSpeed * speedModifier;
    }

    protected Vector3 GetPlayerHorizontalVelocity()
    {
        Vector3 playerHorizontalVelocity = stateMachine.Player.Rigidbody.linearVelocity;
        playerHorizontalVelocity.y = 0f;
        return playerHorizontalVelocity;
    }

    protected Quaternion GetPlayerRotation(Vector3 movementDirection)
    {
        
        Quaternion baseRotation = Quaternion.LookRotation(movementDirection, Vector3.up);
        Quaternion mainRotation = baseRotation * Quaternion.Euler(0f, 180f, 0f);
        return mainRotation;
    }

    protected void ResetVelocity()
    {
        stateMachine.Player.Rigidbody.linearVelocity = Vector3.zero;
    }
    #endregion

    #region Reusable Methods
    protected virtual void AddInputActionsCallBack()
    {
        stateMachine.Player.Inputs.playerActions.Movement.canceled += OnMovementCanceled;

        stateMachine.Player.Inputs.playerActions.Dash.started += OnDashStarted;
    }

    protected virtual void RemoveInputActionsCallBack()
    {
        stateMachine.Player.Inputs.playerActions.Movement.canceled -= OnMovementCanceled;

        stateMachine.Player.Inputs.playerActions.Dash.started -= OnDashStarted;
    }

    protected void DecelerateHorizontally()
    {
        Vector3 playerHorizontalVelocity = GetPlayerHorizontalVelocity();

        stateMachine.Player.Rigidbody.AddForce(-playerHorizontalVelocity * movementDecelerationForce, ForceMode.Acceleration);
    }

    protected bool IsMovingHorizontally(float minimumMagnitude = 0.1f)
    {
        Vector3 playerHorizontalVelocity = GetPlayerHorizontalVelocity();
        Vector2 playerHorizontalMovement = new Vector2(playerHorizontalVelocity.x, playerHorizontalVelocity.z);

        return playerHorizontalMovement.magnitude > minimumMagnitude;
    }
    #endregion

    #region Input Methods
    protected virtual void OnMovementCanceled(InputAction.CallbackContext context)
    {
        
    }

    protected virtual void OnDashStarted(InputAction.CallbackContext context)
    {
        stateMachine.ChangeState(stateMachine.DashingState);
    }
    #endregion
}
