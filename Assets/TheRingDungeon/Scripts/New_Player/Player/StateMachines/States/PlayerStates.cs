using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerStates : IState
{
    protected PlayerStateMachine stateMachine;

    public bool mouseClick;

    protected PlayerGroundedData movementData;
    protected float rotationSpeed = 1000f;

    //public float movementDecelerationForce;
    
    public PlayerStates(PlayerStateMachine playerStateMachine)
    {
        stateMachine = playerStateMachine;

        movementData = stateMachine.Player.Data.GroundedData;

        InitializeData();
    }

    private void InitializeData()
    {
        SetBaseRotationData();
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
        stateMachine.ReusableData.MovementInput = stateMachine.Player.Inputs.playerActions.Movement.ReadValue<Vector2>();

    }

    private void Move()
    {
        if (stateMachine.ReusableData.MovementInput == Vector2.zero || stateMachine.ReusableData.MovementSpeedModifier == 0f)
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
        return new Vector3(stateMachine.ReusableData.MovementInput.x, 0f, stateMachine.ReusableData.MovementInput.y);   
    }

    protected float GetMovementSpeed()
    {
        return movementData.BaseSpeed * stateMachine.ReusableData.MovementSpeedModifier * stateMachine.ReusableData.MovementOnSlopeSpeedModifier;
    }

    protected Vector3 GetPlayerVerticalVelocity()
    {
        return new Vector3(0f, stateMachine.Player.Rigidbody.linearVelocity.y, 0f);
    }

    protected Vector3 GetPlayerHorizontalVelocity()
    {
        Vector3 playerHorizontalVelocity = stateMachine.Player.Rigidbody.linearVelocity;
        playerHorizontalVelocity.y = 0f;
        return playerHorizontalVelocity;
    }

    protected void RotateTowardsTargetRotation()
    {
        float currentYAngle = stateMachine.Player.Rigidbody.rotation.eulerAngles.y;

        if (currentYAngle == stateMachine.ReusableData.CurrentTargetRotation.y)
        {
            return;
        }

        float smoothedYangle = Mathf.SmoothDampAngle(currentYAngle, stateMachine.ReusableData.CurrentTargetRotation.y, ref stateMachine.ReusableData.DampedTargetRotationCurrentVelocity.y, stateMachine.ReusableData.TimeToReachTargetRotation.y - stateMachine.ReusableData.DampedTargetRotationPassedTime.y);

        stateMachine.ReusableData.DampedTargetRotationPassedTime.y += Time.deltaTime;

        Quaternion targetrotation = Quaternion.Euler(0f, smoothedYangle, 0f);

        stateMachine.Player.Rigidbody.MoveRotation(targetrotation);
    }

    protected Quaternion GetPlayerRotation(Vector3 movementDirection)
    {
        
        Quaternion baseRotation = Quaternion.LookRotation(movementDirection, Vector3.up);
        Quaternion mainRotation = baseRotation * Quaternion.Euler(0f, 180f, 0f);
        return mainRotation;
    }

    private float GetDirectionAngle(Vector3 direction)
    {
        float directionAngle = Mathf.Atan2(direction.x, direction.z) * Mathf.Rad2Deg;

        if (directionAngle < 0f)
        {
            directionAngle += 360f;
        }

        return directionAngle;
    }

    private void UpdateTargetRotationData(float targetAngle)
    {
        stateMachine.ReusableData.CurrentTargetRotation.y = targetAngle;

        stateMachine.ReusableData.DampedTargetRotationPassedTime.y = 0f;
    }

    protected float UpdateTargetRotation(Vector3 direction)
    {
        float directionAngle = GetDirectionAngle(direction);

        if (directionAngle != stateMachine.ReusableData.CurrentTargetRotation.y)
        {
            UpdateTargetRotationData(directionAngle);
        }

        return directionAngle;
    }

    protected void ResetVelocity()
    {
        stateMachine.Player.Rigidbody.linearVelocity = Vector3.zero;
    }
    #endregion

    #region Reusable Methods
    protected void SetBaseRotationData()
    {
        stateMachine.ReusableData.RotationData = movementData.BaseRotationData;

        stateMachine.ReusableData.TimeToReachTargetRotation = stateMachine.ReusableData.RotationData.TargetRotationReachTime;
    }

    protected void StartAnimation(int animationHash)
    {
        stateMachine.Player.Animator.SetBool(animationHash, true);
    }

    protected void StopAnimation(int animationHash)
    {
        stateMachine.Player.Animator.SetBool(animationHash, false);
    }

    protected virtual void AddInputActionsCallBack()
    {
        
    }

    protected virtual void RemoveInputActionsCallBack()
    {
        
    }

    protected void DecelerateHorizontally()
    {
        Vector3 playerHorizontalVelocity = GetPlayerHorizontalVelocity();

        stateMachine.Player.Rigidbody.AddForce(-playerHorizontalVelocity * stateMachine.ReusableData.MovementDecelerationForce, ForceMode.Acceleration);
    }

    protected bool IsMovingHorizontally(float minimumMagnitude = 0.1f)
    {
        Vector3 playerHorizontalVelocity = GetPlayerHorizontalVelocity();
        Vector2 playerHorizontalMovement = new Vector2(playerHorizontalVelocity.x, playerHorizontalVelocity.z);

        return playerHorizontalMovement.magnitude > minimumMagnitude;
    }
    #endregion

    #region Input Methods
    
    #endregion
}
