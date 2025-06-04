using System;
using TheRingDungeon.Scripts.EnemyGOAP.Utilities;
using UnityEngine;

namespace TheRingDungeon.Scripts.EnemyGOAP.Beta_GOAP
{
    public class AgentBelief
    {
        public string Name { get; }
        private Func<bool> condition = () => false;
        private Func<Vector3> observedLocation = () => Vector3.zero;
        
        public Vector3 Location => observedLocation();
        private AgentBelief(string name) => Name = name;
        public bool Evaluate() => condition();
        
        /// <summary>
        /// Builder for AgentBelief objects using the generic builder pattern
        /// </summary>
        public class Builder : GenericBuilder<Builder, AgentBelief>
        {
            public Builder(string name) 
                : base(new AgentBelief(name)) { }
            
            protected override Builder Self => this;

            public Builder WithCondition(Func<bool> condition) => 
                With(belief => belief.condition = condition);

            public Builder WithLocation(Func<Vector3> observedLocation) => 
                With(belief => belief.observedLocation = observedLocation);
        }
    }
}