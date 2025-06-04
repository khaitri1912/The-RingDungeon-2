// This script defines what goals an agent can pursue
// Goals represent desired world states that agents want to achieve through actions

using System.Collections.Generic;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    /// <summary>
    /// Represents a goal that a GOAP agent wants to achieve
    /// A goal has a priority and a set of desired effects
    /// (beliefs) that should be true when the goal is achieved
    /// </summary>
    public class AgentGoal
    {
        #region Properties and Events
        // The name/identifier of this goal
        // Read-only property that can only be set in constructor
        public string Name { get; }
        
        // The priority of this goal (higher values = more important)
        // This determines which goals are chosen first when multiple goals are available
        // Private setter ensures it can only be modified through the Builder
        public float Priority { get; private set; }
        
        // The set of beliefs that should be true when this goal is achieved,
        // These are the desired world states the agent wants to bring about
        // Using HashSet to prevent duplicates
        public HashSet<AgentBelief> DesiredEffects { get; } = new();
        
        // Private constructor - goals should only be created via the Builder
        // This enforces the Builder pattern usage
        private AgentGoal(string name) => Name = name;
        #endregion
        
        /// <summary>
        /// Builder class for creating AgentGoal instances
        /// Follows the Builder design pattern to allow flexible object construction
        /// </summary>
        public class Builder
        {
            // The goal instance being constructed
            private readonly AgentGoal goal;
            
            // Constructor that creates a new goal with the given name
            public Builder(string name) => goal = new AgentGoal(name);

            // Sets the priority value for the goal
            // Higher priority goals are considered more important by the planner
            // Returns this builder instance for method chaining
            public Builder WithPriority(float priority)
            {
                goal.Priority = priority;
                return this;
            }

            // Adds a desired effect (belief) to the goal's set of effects
            // These are the conditions that should be true when the goal is achieved
            // Returns this builder instance for method chaining
            public Builder WithDesiredEffects(AgentBelief effect)
            {
                goal.DesiredEffects.Add(effect);
                return this;
            }

            // Returns the fully constructed goal object
            // Finalizes the building process
            public AgentGoal Build() => goal;
        }
    }
}