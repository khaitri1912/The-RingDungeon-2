using UnityEngine;

public class PlayerStates : IState
{
    protected PlayerStateMachine stateMachine;

    public Vector2 movementInput;
    public bool mouseClick;

    protected float baseSpeed = 5f;
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
        if (movementInput == Vector2.zero || mouseClick == false)
        {
            return;
        }

        float moveSpeed = GetMovementSpeed();

        if (mouseClick)
        {
            Ray ray = Camera.main.ScreenPointToRay(movementInput);
            if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity))
            {
                clickPos = hit.point;
                Debug.Log("Click position1: " + hit.point);
                Debug.DrawLine(ray.origin, hit.point, Color.red, 1f);
                stateMachine.Player.agent.SetDestination(hit.point);
            }
            else
            {
                Debug.Log("Raycast ko cham gi ca!");
            }
        }
        else
        {
            Debug.Log("Click position2: " + clickPos);
        }

        if (mouseClick)
        {
            stateMachine.Player.transform.position = Vector3.MoveTowards(stateMachine.Player.transform.position, clickPos, moveSpeed * Time.deltaTime);

            if (Vector3.Distance(stateMachine.Player.transform.position, clickPos) < 0.1f)
            {
                mouseClick = false;
            }
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
