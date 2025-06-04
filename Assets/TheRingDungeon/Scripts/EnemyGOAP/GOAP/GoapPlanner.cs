using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    // Interface that defines the contract for any GOAP planner implementation
    // Allows for different planning algorithms to be swapped in if needed
    public interface IGoapPlanner {
        // Method that generates an action plan given an agent, available goals, and optionally a recent goal
        // Returns an ActionPlan or null if no plan can be created
        ActionPlan Plan(GoapAgent agent, HashSet<AgentGoal> goals, AgentGoal mostRecentGoal = null);
    }

    // Main implementation of the GOAP planner
    // Uses backward-chaining to find sequences of actions that achieve goals
    public class GoapPlanner : IGoapPlanner
    {
        // Creates a plan by finding a sequence of actions to achieve a goal
        // Returns null if no plan can be created
        public ActionPlan Plan(GoapAgent agent, HashSet<AgentGoal> goals, AgentGoal mostRecentGoal = null)
        {
            // Filter goals to only include those with at least one desired effect that isn't already true
            // Then order them by priority (highest first), with a slight penalty for the most recent goal
            // This penalty helps prevent thrashing between goals of equal priority
            // Order goals by priority, descending
            var orderedGoals = goals
                .Where(g => g.DesiredEffects.Any(b => !b.Evaluate()))
                .OrderByDescending(g => g == mostRecentGoal ? g.Priority - 0.01 : g.Priority)
                .ToList();
            
            // Attempt to create a plan for each goal in priority order
            // Once a valid plan is found, return it immediately
            foreach (var goal in orderedGoals)
            {
                // Create a goal node representing the desired world state
                // This is the root of our planning search tree
                Node goalNode = new Node(null, null, goal.DesiredEffects, 0);
                
                // Use recursive depth-first search to find a plan
                // This builds a tree of actions that could lead to the goal
                if (FindPath(goalNode, agent.actions))
                {
                    // If we found a path but the goal node has no actions, it's a "dead leaf"
                    // This means we couldn't actually find a valid plan, so try the next goal
                    if(goalNode.IsLeafDead) continue;
                    
                    // Create a stack to store the actions in the correct execution order
                    // A stack is used because we're traversing the tree from leaf to root
                    Stack<AgentAction> actionStack = new Stack<AgentAction>();
                    
                    // Start from the goal node and work backwards through the tree
                    // Always taking the cheapest path at each level (greedy algorithm)
                    while (goalNode.Leaves.Count > 0)
                    {
                        // Find the child node with the lowest cost
                        var cheapestLeaf = goalNode.Leaves.OrderBy(leaf => leaf.Cost).First();
                        
                        // Move to that node in our traversal
                        goalNode = cheapestLeaf;
                        
                        // Add its action to our plan
                        actionStack.Push(cheapestLeaf.Action);
                    }
                    
                    // Return the complete plan with the goal, actions, and total cost
                    return new ActionPlan(goal, actionStack, goalNode.Cost);
                }
            }

            // If we've tried all goals and found no plans, log a warning and return null
            Debug.LogWarning("No Plan found");
            return null;
        }

        // TODO: Consider a more powerful search algorithm like A* or D*
        // Recursive method that builds a tree of actions to satisfy a goal
        // Returns true if a valid path is found, false otherwise
        private bool FindPath(Node parent, HashSet<AgentAction> actions)
        {
            // Examine each available action to see if it helps achieve the goal
            foreach (var action in actions)
            {
                // Get the currently required effects (desired world state)
                var requiredEffects = parent.RequiredEffects;
                
                // Remove any effects that are already true in the current world state
                // We don't need to plan for conditions that are already satisfied
                requiredEffects.RemoveWhere(b => b.Evaluate());
                
                // If there are no more effects needed, we've found a complete plan
                if(requiredEffects.Count == 0)
                    return true;

                // Check if this action provides any of the required effects
                // Only consider actions that help us achieve our goal
                if (action.Effects.Any(requiredEffects.Contains))
                {
                    // Create a new set of required effects for the next level of the tree
                    // Start by copying the current requirements
                    var newRequiredEffects = new HashSet<AgentBelief>(requiredEffects);
                    
                    // Remove the effects this action provides
                    newRequiredEffects.ExceptWith(action.Effects);
                    
                    // Add this action's preconditions as new requirements
                    // These become the new sub-goals for the next level of planning
                    newRequiredEffects.UnionWith(action.Preconditions);
                    
                    // Create a new set of available actions, excluding the current one
                    // This prevents infinite recursion from using the same action repeatedly
                    var newAvailableActions = new HashSet<AgentAction>(actions);
                    newAvailableActions.Remove(action);
                    
                    // Create a new node representing this action and its requirements
                    // Add the action's cost to the accumulated path cost
                    var newNode = new Node(parent, action, newRequiredEffects, parent.Cost + action.Cost);
                    
                    // Recursively continue planning with the new requirements and available actions
                    if (FindPath(newNode, newAvailableActions))
                    {
                        // If a valid path was found, add this node to the parent's leaves
                        parent.Leaves.Add(newNode);
                        
                        // Remove the action's preconditions from the required effects
                        // This represents solving some of the requirements
                        newRequiredEffects.ExceptWith(newNode.Action.Preconditions);
                    }
                    
                    // Check if all effects at this level have been satisfied
                    // If so, we've found a valid sub-plan
                    if(newRequiredEffects.Count == 0) 
                        return true;
                }
            }
            // If we've tried all actions and couldn't find a valid path, return false
            return false;
        }
    }

    // Represents a node in the planning search tree
    // Each node corresponds to an action and its resulting world state
    public class Node
    {
        // Reference to the parent node (the next action in the plan)
        // Null for the root (goal) node
        public Node Parent { get; set; }
        
        // The action associated with this node
        // Null for the root (goal) node
        public AgentAction Action { get; set; }
        
        // The set of world states (beliefs) that must be true after this action
        // These are the preconditions for the parent node's action
        public HashSet<AgentBelief> RequiredEffects { get; }
        
        // Child nodes representing actions that could satisfy this node's requirements
        // Each leaf represents a possible next step in the plan
        public List<Node> Leaves { get; }
        
        // The total cost of the plan up to this node
        // Used to find the cheapest path through the tree
        public float Cost { get; set; }
        
        // A node is "dead" if it has no children and no action
        // This indicates a planning branch that led nowhere
        public bool IsLeafDead => Leaves.Count == 0 && Action == null;

        // Constructor initializes a new node with parent, action, effects, and cost
        public Node(Node parent, AgentAction action, HashSet<AgentBelief> effects, float cost)
        {
            Parent = parent;
            Action = action;
            // Create a new HashSet to avoid modifying the original set
            RequiredEffects = new HashSet<AgentBelief>(effects);
            // Initialize an empty list for child nodes
            Leaves = new List<Node>();
            Cost = cost;
        }
    }
    
    // Represents a complete plan to achieve a goal
    // Contains the goal, sequence of actions, and total cost
    public class ActionPlan 
    {
        // The goal this plan aims to achieve
        public AgentGoal AgentGoal { get; }
        
        // The sequence of actions to execute
        // Stored as a stack so actions can be popped in execution order
        public Stack<AgentAction> Actions { get; }
        
        // The total cost of all actions in the plan
        public float TotalCost { get; set; }

        // Constructor initializes a new plan with goal, actions, and cost
        public ActionPlan(AgentGoal goal, Stack<AgentAction> actions, float totalCost)
        {
            AgentGoal = goal;
            Actions = actions;
            TotalCost = totalCost;
        }
    }
}