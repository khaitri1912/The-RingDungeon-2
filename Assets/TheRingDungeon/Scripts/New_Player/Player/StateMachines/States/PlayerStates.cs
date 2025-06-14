using UnityEngine;

public class PlayerStates : IState
{
    protected PlayerStateMachine stateMachine;

    public Vector2 movementInput;
    public bool mouseClick;

    protected float baseSpeed = 5f;
    protected float speedModifier = 1f;
    protected float rotationSpeed = 1000f;

    public PlayerStates(PlayerStateMachine playerStateMachine)
    {
        stateMachine = playerStateMachine;
    }

    public void Enter()
    {
        Debug.Log("State: " + GetType().Name);
    }

    public void Exit()
    {
        
    }

    public void HandleInput()
    {
        ReadMouseInput();
    }

    public void PhysicsUpdate()
    {
        Move();
    }

    public void Update()
    {
        
    }

    private void ReadMouseInput()
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
}
