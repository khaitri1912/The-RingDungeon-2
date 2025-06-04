// This script defines actions that agents can take to change the world state.

using System.Collections.Generic;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    public class AgentAction
    {
        #region Properties and Events
        // Public read-only property for the action's name
        public string Name { get; }
        
        // Cost of performing this action (used by planner to find optimal plans)
        // Can only be set within this class or by the Builder
        public float Cost { get; private set; }

        // Set of beliefs that must be true for this action to be executable
        // Using HashSet to prevent duplicate preconditions
        public HashSet<AgentBelief> Preconditions { get; } = new();
        
        // Set of beliefs that will become true after the action is executed
        // These are the changes to the world state caused by this action
        public HashSet<AgentBelief> Effects { get; } = new();
        
        // Reference to the strategy that defines how this action is performed
        // The strategy pattern separates the action definition from its implementation
        private IActionStrategy strategy;
        
        // Property that checks if the action has completed by delegating to strategy
        // Using expression-bodied property syntax (=>)
        public bool Complete => strategy.Complete;
        
        // Private constructor ensures actions can only be created via Builder
        // Takes the action name as parameter and assigns it to the Name property
        private AgentAction(string name) => Name = name;
        #endregion

        #region Key Methods
        // Starts the action by delegating to the strategy's Start method
        // Called when the agent begins executing this action
        public void Start() => strategy.Start();
        
        // Updates the action's execution state based on elapsed time
        // Called every frame when this action is being performed
        public void Update(float deltaTime)
        {
            // Only update the strategy if the action can be performed
            // This checks any runtime conditions in the strategy
            if(strategy.CanPerform)
                strategy.Update(deltaTime);
            
            // If the strategy cannot perform, exit early without applying effects
            // This prevents effects from being applied when action isn't complete
            if(!strategy.CanPerform) return;
            
            // If we reached this point, apply all effects of this action
            // This updates the world state based on this action's results
            foreach (var effect in Effects) 
                effect.Evaluate();
        }

        // Stops the action by delegating to the strategy's Stop method
        // Called when the action is interrupted or completed
        public void Stop() => strategy.Stop();
        #endregion
        
        // Builder inner class implements the Builder pattern for creating actions
        // This makes action creation more readable and flexible
        public class Builder
        {
            // Reference to the action being constructed
            private readonly AgentAction action;
            
            // Constructor that creates a new action with the specified name
            // Also sets a default cost of 1 for the action
            public Builder(string name) {
                action = new AgentAction(name) {
                    Cost = 1
                };
            }

            // Sets a custom cost for the action
            // Returns this builder instance for method chaining
            public Builder WithCost(float cost)
            {
                action.Cost = cost;
                return this;
            }

            // Sets the strategy that defines how this action is performed
            // Returns this builder instance for method chaining
            public Builder WithStrategy(IActionStrategy strategy)
            {
                action.strategy = strategy;
                return this;
            }

            // Adds a precondition (required belief) to this action
            // Returns this builder instance for method chaining
            public Builder WithPreconditions(AgentBelief preconditions)
            {
                action.Preconditions.Add(preconditions);
                return this;
            }

            // Adds an effect (resulting belief) to this action
            // Returns this builder instance for method chaining
            public Builder AddEffect(AgentBelief effects)
            {
                action.Effects.Add(effects);
                return this;
            }
            
            // Returns the fully constructed action instance
            // Finalizes the building process
            public AgentAction Build() => action;
        }
    }
}