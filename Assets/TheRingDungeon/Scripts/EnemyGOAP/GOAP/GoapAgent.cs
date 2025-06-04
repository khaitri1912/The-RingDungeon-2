using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;
using System.Linq;
using TheRingDungeon.Scripts.EnemyGOAP.Animation;
using TheRingDungeon.Scripts.EnemyGOAP.Utilities;

namespace TheRingDungeon.Scripts.EnemyGOAP.GOAP
{
    [RequireComponent(typeof(NavMeshAgent))]
    [RequireComponent(typeof(AnimationController))]
    public class GoapAgent : MonoBehaviour
    {
        [Header("Sensors")]
        [SerializeField] private Sensor chaseSensor;
        [SerializeField] private Sensor attackSensor;
        
        [Header("Known Locations")]
        [SerializeField] private Transform restingPosition;
        [SerializeField] private Transform foodShack;
        [SerializeField] private Transform doorOnePosition;
        [SerializeField] private Transform doorTwoPosition;
        
        private NavMeshAgent navMeshAgent;
        private AnimationController animations;
        private Rigidbody rb;
        
        [Header("Stats")]
        public float health = 100;
        public float stamina = 100;
        
        private CountdownTimer statsTimer;

        private GameObject target;
        private Vector3 destination;
        
        private AgentGoal lastGoal;
        public AgentGoal currentGoal;
        public ActionPlan actionPlan;
        public AgentAction currentAction;
        
        public Dictionary<string, AgentBelief> beliefs;
        public HashSet<AgentAction> actions;
        public HashSet<AgentGoal> goals;

        private IGoapPlanner gPlanner;

        private void Awake()
        {
            navMeshAgent = GetComponent<NavMeshAgent>();
            animations = GetComponent<AnimationController>();
            rb = GetComponent<Rigidbody>();
            rb.freezeRotation = true;
            
            gPlanner = new GoapPlanner();
        }

        private void Start()
        {
            SetupTimers();
            SetupBeliefs();
            SetupActions();
            SetupGoals();
        }

        private void Update()
        {
            statsTimer.Tick(Time.deltaTime);
            animations.SetSpeed(navMeshAgent.velocity.magnitude);
            
            // Update the plan and current action if there is one
            if (currentAction == null)
            {
                Debug.Log("Calculating any potential action");
                CalculatePlan();

                if (actionPlan != null && actionPlan.Actions.Count > 0)
                {
                    navMeshAgent.ResetPath();
                    
                    currentGoal = actionPlan.AgentGoal;
                    currentAction = actionPlan.Actions.Pop();
                    currentAction.Start();
                    
                    Debug.Log($"Goal: {currentGoal.Name} with {actionPlan.Actions.Count} actions in plan");
                    Debug.Log($"Popped action: {currentAction.Name}");
                }
            }
            
            // If we have a current action, execute it
            if (actionPlan != null && currentAction != null)
            {
                currentAction.Update(Time.deltaTime);

                if (currentAction.Complete)
                {
                    Debug.Log($"Action: {currentAction.Name} complete");
                    currentAction.Stop();
                    currentAction = null;

                    if (actionPlan.Actions.Count == 0)
                    {
                        Debug.Log($"Plan completed");
                        lastGoal = currentGoal;
                        currentGoal = null;
                    }
                }
            }
        }

        private void SetupTimers()
        {
            statsTimer = new CountdownTimer(2f);
            statsTimer.OnTimerStop += () =>
            {
                UpdateStats();
                statsTimer.Start();
            };
            statsTimer.Start();
        }
        private void SetupBeliefs()
        {
            beliefs = new Dictionary<string, AgentBelief>();
            BeliefFactory factory = new BeliefFactory(this, beliefs);
            
            factory.AddBelief("Nothing", () => false);
            
            factory.AddBelief("AgentIdle", () => !navMeshAgent.hasPath);
            factory.AddBelief("AgentMoving", () => navMeshAgent.hasPath);
        }
        
        private void SetupActions()
        {
            actions = new HashSet<AgentAction>();
            
            actions.Add(new AgentAction.Builder("Relax")
                .WithStrategy(new IdleStrategy(5))
                .AddEffect(beliefs["Nothing"])
                .Build());

            actions.Add(new AgentAction.Builder("Wander Around")
                .WithStrategy(new WanderStrategy(navMeshAgent, 30))
                .AddEffect(beliefs["AgentMoving"])
                .Build());
        }
        
        private void SetupGoals()
        {
            goals = new HashSet<AgentGoal>();
            
            goals.Add(new AgentGoal.Builder("Chill out")
                .WithPriority(1)
                .WithDesiredEffects(beliefs["Nothing"])
                .Build());
            
            goals.Add(new AgentGoal.Builder("Wander")
                .WithPriority(1)
                .WithDesiredEffects(beliefs["AgentMoving"])
                .Build());
        }

        // TODO move to stats system
        private void UpdateStats()
        {
            stamina += InRangeOf(restingPosition.position, 3f) ? 20 : -10;
            health += InRangeOf(foodShack.position, 3f) ? 20 : -5;
            stamina = Mathf.Clamp(stamina, 0, 100);
            health = Mathf.Clamp(health, 0, 100);
        }

        private bool InRangeOf(Vector3 pos, float range) => 
            Vector3.Distance(transform.position, pos) < range;
        
        private void OnEnable() => chaseSensor.OnTargetChanged += HandleTargetChanged;
        private void OnDisable() => chaseSensor.OnTargetChanged -= HandleTargetChanged;
        
        private void HandleTargetChanged()
        {
            Debug.Log("Target changed, clearing current action and goal");
            // Force the planner to re-evaluate the plan
            currentAction = null;
            currentGoal = null;
        }

        private void CalculatePlan()
        {
            var priorityLevel = currentGoal?.Priority ?? 0;
            
            HashSet<AgentGoal> goalsToCheck = goals;
            
            // If we have a current goal, we only want to check goal with the higher priority
            if (currentGoal != null)
            {
                Debug.Log("Current goal exists, checking goals with higher priority");
                goalsToCheck = new HashSet<AgentGoal>(goals.Where(g => g.Priority > priorityLevel));
            }
            
            var potentialPlan = gPlanner.Plan(this, goalsToCheck, lastGoal);
            if (potentialPlan != null)
            {
                actionPlan = potentialPlan;
            }
        }
    }
}