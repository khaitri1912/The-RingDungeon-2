// The Sensor will be responsible for helping the Enemies to detect the Player(or other targets) within a certain radius

using System;
using UnityEngine;
using TheRingDungeon.Scripts.EnemyGOAP.Utilities;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    [RequireComponent(typeof(SphereCollider))]
    public class Sensor : MonoBehaviour
    {
        #region Inspector Fields
        [SerializeField] private float detectionRadius = 5f;
        [SerializeField] private float timerInterval = 1f;
        #endregion
        
        #region Properties and Events
        // Event that triggers when the target's position changes
        // The 'delegate {}' creates an empty delegate to prevent null reference exceptions
        public event Action OnTargetChanged = delegate { };
        
        // Returns target position or Vector3.zero if no target
        // The "=>" syntax is a C# expression-bodied property (shorthand for a get method)
        public Vector3 TargetPosition => target ? target.transform.position : Vector3.zero;
        
        // Determines if a valid target is detected
        // Property that checks if we have a valid target (non-zero position)
        public bool IsTargetInRange => TargetPosition != Vector3.zero;
        #endregion
        
        #region Private Fields
        private SphereCollider detectionRange;
        private GameObject target;
        private Vector3 lastKnownPosition;
        private CountdownTimer timer;
        #endregion

        #region Unity Lifecycle Methods
        private void Awake()
        {
            detectionRange = GetComponent<SphereCollider>();
            detectionRange.isTrigger = true;
            detectionRange.radius = detectionRadius;
        }

        private void Start()
        {
            // Create a timer that will update at the specified interval
            timer = new CountdownTimer(timerInterval);
            
            // When the timer completes, update the target position
            // OrNull() is a custom extension method that safely returns null if target is null
            timer.OnTimerStop += () => UpdateTargetPosition(target.OrNull());
            
            // Start the timer
            timer.Start();
        }

        // Update the timer with the time elapsed since last frame
        private void Update() => timer.Tick(Time.deltaTime);
        
        // Unity callback when another collider enters the trigger area
        private void OnTriggerEnter(Collider other)
        {
            // If the object isn't tagged as "Player", ignore it
            if(!other.CompareTag("Player")) return;
            
            // Update the target position with the player GameObject
            UpdateTargetPosition(other.gameObject);
        }

        // Unity callback when a collider exits the trigger area
        private void OnTriggerExit(Collider other)
        {
            // If the object isn't tagged as "Player", ignore it
            if(!other.CompareTag("Player")) return;
            
            // Clear the target (passing null explicitly)
            UpdateTargetPosition();
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = IsTargetInRange ? Color.red : Color.green;
            Gizmos.DrawWireSphere(transform.position, detectionRadius);
        }
        #endregion
        
        #region Custom Methods
        // Updates the current target and checks if the position has changed
        private void UpdateTargetPosition(GameObject targetObject = null)
        {
            // Set the current target reference
            target = targetObject;
            
            // Check if the target is in range AND either the position changed, or it's the first detection
            if (IsTargetInRange && (lastKnownPosition != TargetPosition || lastKnownPosition != Vector3.zero))
            {
                // Update the last known position
                lastKnownPosition = TargetPosition;
                
                // Trigger the OnTargetChanged event to notify subscribers
                OnTargetChanged.Invoke();
            }
        }
        #endregion
    }
}