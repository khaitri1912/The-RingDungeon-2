// This script defines concrete implementations of action behaviors using the Strategy pattern
//  separates the "what" (actions) from the "how" (implementations)

using UnityEngine;
using UnityEngine.AI;
using TheRingDungeon.Scripts.EnemyGOAP.Utilities;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    // Interface that all action strategies must implement
    // Provides a common contract for different types of behaviors
    public interface IActionStrategy
    {
        // Property that determines if the strategy can be performed right now
        // Strategies may have runtime conditions that prevent execution
        bool CanPerform { get; }
        
        // Property that determines if the strategy has completed its task
        // Used by the action to know when it's done
        bool Complete { get; }
        
        // Method called when the strategy starts executing
        // Empty default implementation allows optional implementation in derived classes
        void Start() {}
        
        // Method called every frame to update the strategy's state
        // Takes delta time to ensure time-based operations are frame-rate independent
        void Update(float deltaTime) {}
        
        // Method called when the strategy is stopped or interrupted
        // Empty default implementation allows optional implementation in derived classes
        void Stop() {}
    }

    // Strategy for making the agent idle/wait for a duration
    public class IdleStrategy : IActionStrategy
    {
        // Agent can always idle, no conditions prevent this
        // Returns true unconditionally using expression bodied property
        public bool CanPerform => true;
        
        // Property that tracks if the idle period has completed
        // Backing field is modified by timer events
        public bool Complete { get; private set; }
        
        // Timer that controls how long the agent idles
        // Readonly ensures the reference can't be changed after initialization
        private readonly CountdownTimer timer;

        // Constructor that takes the duration to idle
        // Sets up timer and connects events
        public IdleStrategy(float duration)
        {
            // Create a new timer with the specified duration
            timer = new CountdownTimer(duration);
            
            // When the timer starts, mark the strategy as not complete
            timer.OnTimerStart += () => Complete = false;
            
            // When the timer stops, mark the strategy as complete
            timer.OnTimerStop += () => Complete = true;
        }
        
        // Start the idle period by starting the timer
        // Using expression-bodied method for concise implementation
        public void Start() => timer.Start();
        
        // Update the timer with the elapsed time since last frame
        // Using expression-bodied method for concise implementation
        public void Update(float deltaTime) => timer.Tick(deltaTime);
    }

    // Strategy for making the agent wander randomly around the environment
    // Uses Unity's NavMesh system for pathfinding
    public class WanderStrategy : IActionStrategy
    {
        // Reference to the NavMeshAgent component that handles movement
        // Readonly ensures the reference can't be changed after initialization
        private readonly NavMeshAgent agent;
        
        // The Maximum distance the agent can wander from its current position
        // Defines the radius of the circular area to pick random points from
        private readonly float wanderRadius;

        // Strategy can be performed as long as it's not already complete
        // Prevents restarting a completed wander action
        public bool CanPerform => !Complete;
        
        // Strategy is complete when agent reaches destination (within 2 units)
        // Also checks if a path is still being calculated to avoid pre-mature completion
        public bool Complete => agent.remainingDistance <= 2f && !agent.pathPending;

        // Constructor takes the NavMeshAgent component and wanders radius
        // Stores references for later use
        public WanderStrategy(NavMeshAgent agent, float wanderRadius)
        {
            this.agent = agent;
            this.wanderRadius = wanderRadius;
        }

        // Starts the wander action by selecting a random destination
        // Called when the agent begins this strategy
        public void Start()
        {
            // Try up to 5 times to find a valid position on the NavMesh
            // This helps ensure we don't get stuck trying to path to an unreachable location
            for (int i = 0; i < 5; i++)
            {
                // Generate a random direction vector within the wander radius
                // The With() extension method is replacing the Y component with 0
                // (keeping movement on ground plane)
                Vector3 randomDirection = (Random.insideUnitSphere * wanderRadius).With(y: 0);

                // Try to find the nearest point on the NavMesh to our random position
                // This ensures the agent only walks on valid surfaces1
                if (NavMesh.SamplePosition(agent.transform.position + randomDirection, out var hit, wanderRadius, 1))
                {
                    // If a valid position is found, set it as the destination
                    agent.SetDestination(hit.position);
                    // Exit the method immediately since we found a valid destination
                    return;
                }
            }
        }
    }
}