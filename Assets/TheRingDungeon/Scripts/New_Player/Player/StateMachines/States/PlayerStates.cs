using UnityEngine;

public class PlayerStates : IState
{
    protected PlayerStateMachine stateMachine;

    public Vector2 movementInput;
    public bool mouseClick;

    protected float baseSpeed = 20f;
    protected float speedModifier = 1f;
    protected Vector3 clickPos;
    protected float stopDistance = 0.5f;

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
        //Move();
    }

    public void Update()
    {
        Move();
    }

    private void ReadMouseInput()
    {
        movementInput = stateMachine.Player.Inputs.playerActions.MousePos.ReadValue<Vector2>();
        mouseClick = stateMachine.Player.Inputs.playerActions.Mouse.IsPressed();
    }

    private void Move()
    {
        if (movementInput == Vector2.zero /*|| mouseClick == false*/)
        {
            return;
        }

        Vector3 moveDirection = GetMovementDirection();

        float moveSpeed = GetMovementSpeed();

        Vector3 targetDirection = new Vector3 ( moveDirection.x, stateMachine.Player.transform.position.y, moveDirection.z );

        stateMachine.Player.transform.position = Vector3.MoveTowards(stateMachine.Player.transform.position, targetDirection, moveSpeed * Time.deltaTime);

        if (Vector3.Distance(stateMachine.Player.transform.position, targetDirection) < 0.1f)
        {
            mouseClick = false;
        }
    }

    private Vector3 GetMovementDirection()
    {
        if (mouseClick)
        {
            Ray ray = Camera.main.ScreenPointToRay(movementInput);
            if (Physics.Raycast(ray, out RaycastHit hit))
            {
                clickPos = hit.point;
                Debug.Log("Click position1: " + clickPos);
            }
        }
        else
        {
            Debug.Log("Click position2: " + clickPos);
        }
        return clickPos;
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
}
