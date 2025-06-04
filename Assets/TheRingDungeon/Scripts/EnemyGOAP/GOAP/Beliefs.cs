// Beliefs is a system that represents what an agent (an Enemy, ...) knows about the world

using System;
using System.Collections.Generic;
using UnityEngine;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    /// <summary>
    /// Factory class for creating different types of beliefs for a GOAP agent.
    /// Acts as a simplified interface for belief creation with different conditions.
    /// </summary>
    public class BeliefFactory
    {
        // Reference to the agent that will own these beliefs
        private readonly GoapAgent agent;
        
        // Reference to the dictionary where beliefs will be stored
        private readonly Dictionary<string, AgentBelief> beliefs;
        
        /// <summary>
        /// Constructor that initializes the factory with the agent and beliefs dictionary
        /// </summary>
        /// <param name="agent">The agent that will own these beliefs</param>
        /// <param name="beliefs">Dictionary to store created beliefs in</param>
        public BeliefFactory(GoapAgent agent, Dictionary<string, AgentBelief> beliefs)
        {
            this.agent = agent;
            this.beliefs = beliefs;
        }
        
        /// <summary>
        /// Creates a basic belief with a condition that can be evaluated to true or false
        /// </summary>
        /// <param name="key">Unique identifier for the belief</param>
        /// <param name="condition">Function that returns true if the belief is true</param>
        public void AddBelief(string key, Func<bool> condition)
        {
            // Create a new belief with the given key and condition, then add it to the dictionary
            beliefs.Add(key, new AgentBelief.Builder(key)
                .WithCondition(condition)   // Set the condition function
                .Build());                  // Build and return the complete belief                  
        }

        /// <summary>
        /// Creates a belief based on a sensor's target detection
        /// </summary>
        /// <param name="key">Unique identifier for the belief</param>
        /// <param name="sensor">Sensor to check for target detection</param>
        public void AddSensorBelief(string key, Sensor sensor)
        {
            // Create a belief that evaluates to true when the sensor detects a target
            beliefs.Add(key, new AgentBelief.Builder(key)
                .WithCondition(() => sensor.IsTargetInRange)    // The Condition is true if sensor detects a target
                .WithLocation(() => sensor.TargetPosition)      // The location is the target's position
                .Build());
        }
        
        /// <summary>
        /// Creates a belief based on agent's proximity to a Transform
        /// </summary>
        /// <param name="key">Unique identifier for the belief</param>
        /// <param name="distance">Maximum distance for the belief to be true</param>
        /// <param name="locationCondition">Transform to check distance against</param>
        public void AddLocationBelief(string key, float distance, Transform locationCondition) => 
            // Call the Vector3 version with the Transform's position
            AddLocationBelief(key, distance, locationCondition.position);
        
        /// <summary>
        /// Creates a belief based on agent's proximity to a position
        /// </summary>
        /// <param name="key">Unique identifier for the belief</param>
        /// <param name="distance">Maximum distance for the belief to be true</param>
        /// <param name="locationCondition">Position to check distance against</param>
        public void AddLocationBelief(string key, float distance, Vector3 locationCondition)
        {
            beliefs.Add(key, new AgentBelief.Builder(key)
                .WithCondition(() => InRangeOf(locationCondition, distance))
                .WithLocation(() => locationCondition)
                .Build());
        }
        
        
        // Helper method that checks if the agent is within a certain range of positions
        // Uses Vector3.Distance to calculate the Euclidean distance between points
        private bool InRangeOf(Vector3 position, float range) => 
            Vector3.Distance(agent.transform.position, position) < range;
    }
    
    /// <summary>
    /// Represents a single piece of knowledge about the world
    /// A belief can be evaluated to true or false and may have an associated location
    /// </summary>
    public class AgentBelief
    {
        #region Properties and Events
        // The name/identifier of this belief
        public string Name { get; }

        // The condition function that determines if this belief is true
        // Default implementation always returns false
        private Func<bool> condition = () => false;
        
        // The function that returns the location associated with this belief
        // Default implementation returns Vector3.zero (origin)
        private Func<Vector3> observedLocation = () => Vector3.zero;
        
        // Public property that executes the location function to get current value
        // Uses expression-bodied property syntax (=>)
        public Vector3 Location => observedLocation();

        // Private constructor - beliefs should only be created via the Builder
        // This enforces the Builder pattern usage
        private AgentBelief(string name) => Name = name;

        // Public method to evaluate if this belief is currently true,
        // Executes the condition function and returns its result
        public bool Evaluate() => condition();
        #endregion
        
        /// <summary>
        /// Builder class for creating AgentBelief instances
        /// Follows the Builder design pattern to allow flexible object construction
        /// </summary>
        public class Builder
        {
            // The belief instance being constructed
            private readonly AgentBelief belief;

            // Constructor that creates a new belief with the given name
            public Builder(string name) => belief = new AgentBelief(name);

            // Sets the condition function for the belief
            // Returns this builder instance for method chaining
            public Builder WithCondition(Func<bool> condition)
            {
                belief.condition = condition;
                return this;
            }

            // Sets the location function for the belief
            // Returns this builder instance for method chaining
            public Builder WithLocation(Func<Vector3> observedLocation)
            {
                belief.observedLocation = observedLocation;
                return this;
            }

            // Returns the fully constructed belief object
            // Finalizes the building process
            public AgentBelief Build() => belief;
        }
    }
}