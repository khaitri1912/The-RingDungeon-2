using UnityEngine;
using UnityEngine.AI;
using UnityEngine.InputSystem;

public class Player : MonoBehaviour
{
    public static Player Instance;
    
    public PlayerStateMachine StateMachine;

    public PlayerInputs Inputs { get; private set; }

    public Rigidbody Rigidbody { get; private set; }

    public NavMeshAgent agent;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }

        Rigidbody = GetComponent<Rigidbody>();

        StateMachine = new PlayerStateMachine(this);

        Inputs = GetComponent<PlayerInputs>();
    }

    private void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        StateMachine.ChangeState(StateMachine.IdlingState);
    }

    private void Update()
    {
        StateMachine.HandleInput();

        StateMachine.Update();
    }

    private void FixedUpdate()
    {
        StateMachine.PhysicUpdate();
    }
}
