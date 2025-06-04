using UnityEngine;

namespace TheRingDungeon.Scripts.Door_System
{
    [RequireComponent(typeof(FrontDoorAreaTrigger))]
    public class FrontDoorAreaTrigger : MonoBehaviour
    {
        public bool isPlayerInFrontDoorArea;
        
        private void OnTriggerEnter(Collider other)
        {
            if(other.CompareTag("Player"))
                isPlayerInFrontDoorArea = true;
        }

        private void OnTriggerExit(Collider other)
        {
            if (other.CompareTag("Player")) 
                isPlayerInFrontDoorArea = false;
        }
    }
}
