using UnityEngine;

namespace TheRingDungeon.Scripts.EnemyGOAP.Animation
{
    public class SkeletonAnimationController : AnimationController
    {
        protected override void SetLocomotionClip() => 
            locomotionClip = Animator.StringToHash("Walk");

        protected override void SetAttackClip() => 
            attackClip = Animator.StringToHash("Attack");

        protected override void SetSpeedHash() => 
            speedHash = Animator.StringToHash("Idle");
    }
}