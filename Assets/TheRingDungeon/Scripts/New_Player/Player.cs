using UnityEngine;
using UnityEngine.AI;
using UnityEngine.InputSystem;

public class Player : MonoBehaviour
{
    public static Player Instance;
    
    public PlayerStateMachine StateMachine;

    [field: SerializeField] public PlayerSO Data { get; private set; }

    public PlayerInputs Inputs { get; private set; }

    public Rigidbody Rigidbody { get; private set; }

    public Animator Animator { get; private set; }

    [field: SerializeField] public CapsuleColliderUtility ColliderUtility { get; private set; }
    [field: SerializeField] public PlayerLayerData LayerData { get; private set; }

    [field: SerializeField] public PlayerAnimationData AnimationData { get; private set; }

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

        Animator = GetComponentInChildren<Animator>();

        ColliderUtility.Initialize(gameObject);
        ColliderUtility.CalculateCapsuleColliderDimensions();

        AnimationData.Initialize();
    }

    private void OnValidate()
    {
        ColliderUtility.Initialize(gameObject);
        ColliderUtility.CalculateCapsuleColliderDimensions();
    }

    private void Start()
    {
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

    public void OnMovementStateAnimationEnterEvent()
    {
        StateMachine.OnAnimationEnterEvent();
    }

    public void OnMovementStateAnimationExitEvent()
    {
        StateMachine.OnAnimationExitEvent();
    }

    public void OnMovementStateAnimationTransitionEvent()
    {
        StateMachine.OnAnimationTransitionEvent();
    }
}
