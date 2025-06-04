using UnityEngine;
using UnityEngine.InputSystem;

namespace TheRingDungeon.Scripts.Door_System
{
    public class DoorController : MonoBehaviour
    {
        public GameObject door;
        
        [Header("Door Settings")]
        [SerializeField] private float openRot;
        [SerializeField] private float closeRot;
        [SerializeField] private float speed;
        [SerializeField] private bool isDoorClosed = true;
        
        [Header("Trigger Areas")]
        [SerializeField] private FrontDoorAreaTrigger frontDoorAreaTrigger; // Direct reference
        [SerializeField] private BackDoorAreaTrigger backDoorAreaTrigger; 
        
        private bool playerInFrontDoorTriggerArea;
        private bool playerInBackDoorTriggerArea;
        
        private bool isRotating;
        private bool isInitialized;
        
        [Header("Input System Reference")]
        [Tooltip("Reference to the Interact action")]
        [SerializeField] private InputActionReference interactAction;

        [Header("Debug Variables")]
        [SerializeField] private bool showDebugInfo;
        
        private void OnEnable()
        {
            if (interactAction != null)
            {
                interactAction.action.performed += OnInteract;
                interactAction.action.Enable();
            }
            else Debug.LogWarning("Interact action reference is not assigned to IsometricDoorInteractor!");
        }

        private void Awake()
        {
            // Validate required components
            if (frontDoorAreaTrigger == null) 
                Debug.LogError("Front door area trigger not assigned!");
            
            if (backDoorAreaTrigger == null) 
                Debug.LogError("Back door area trigger not assigned!");
            
            if (door == null) 
                Debug.LogError("Door GameObject not assigned!");
        }
        
        private void Start()
        {
            // Force an update of the area flags on start
            if (frontDoorAreaTrigger != null)
                playerInFrontDoorTriggerArea = frontDoorAreaTrigger.isPlayerInFrontDoorArea;
                
            if (backDoorAreaTrigger != null)
                playerInBackDoorTriggerArea = backDoorAreaTrigger.isPlayerInBackDoorArea;
                
            // Now the door is fully initialized
            isInitialized = true;
            
            if (showDebugInfo)
                Debug.Log($"Door initialized. Is Door Closed: {isDoorClosed}, Front Trigger: {playerInFrontDoorTriggerArea}, Back Trigger: {playerInBackDoorTriggerArea}");
        }
        
        private void Update()
        {
            // Check for null references before accessing properties
            if (frontDoorAreaTrigger != null)
                playerInFrontDoorTriggerArea = frontDoorAreaTrigger.isPlayerInFrontDoorArea;
                
            if (backDoorAreaTrigger != null)
                playerInBackDoorTriggerArea = backDoorAreaTrigger.isPlayerInBackDoorArea;
                
            // If the door is currently rotating, continue the rotation
            if (isRotating && door != null) 
                RotateDoor();
        }

        private void OnInteract(InputAction.CallbackContext context)
        {
            // Wait until the door is fully initialized
            if (!isInitialized) 
            {
                if (showDebugInfo)
                    Debug.Log("Door not yet initialized, skipping interaction");
                return;
            }
            
            if (context.performed)
            {
                if (showDebugInfo)
                    Debug.Log($"Interact triggered. Front Trigger: {playerInFrontDoorTriggerArea}, " +
                              $"Back Trigger: {playerInBackDoorTriggerArea}, Is Rotating: {isRotating}");
                
                DoorInteract();
            }
        }
        
        private void OnDisable()
        {
            if (interactAction != null) 
                interactAction.action.performed -= OnInteract;
        }
        
        private void RotateDoor()
        {
            var currentRot = door.transform.localEulerAngles;
            float targetRot = isDoorClosed ? closeRot : openRot;
            
            // Calculate the target rotation vector
            Vector3 targetRotation = new Vector3(currentRot.x, targetRot, currentRot.z);
            
            // Smoothly interpolate between current and target rotation
            door.transform.localEulerAngles = Vector3.Lerp(currentRot, targetRotation, speed * Time.deltaTime);
            
            // Check if the door has reached (or nearly reached) its target rotation
            float angleDifference = Mathf.Abs(door.transform.localEulerAngles.y - targetRot);
            if (angleDifference < 0.5f)
            {
                // Set exact rotation to avoid floating point imprecision
                door.transform.localEulerAngles = targetRotation;
                isRotating = false;
                
                if (showDebugInfo)
                    Debug.Log($"Door rotation complete. Is Door Closed: {isDoorClosed}");
            }
        }

        private void DoorInteract()
        {
            // Only interact if the door isn't currently rotating
            if (isRotating)
            {
                if (showDebugInfo)
                    Debug.Log("Door is already rotating, ignoring interaction");
                return;
            }
            
            // Check which side of the door the player is on
            if (playerInFrontDoorTriggerArea || playerInBackDoorTriggerArea)
            {
                isDoorClosed = !isDoorClosed;
                isRotating = true;
                
                if (showDebugInfo)
                    Debug.Log($"Front door interaction. Door is now {(isDoorClosed ? "closing" : "opening")}");
            }
            else if (showDebugInfo)
                Debug.Log("Player not in any door trigger area");
        }
    }
}