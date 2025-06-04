using UnityEngine;

namespace TheRingDungeon.Scripts.Door_System
{
    [RequireComponent(typeof(BackDoorAreaTrigger))]
    public class BackDoorAreaTrigger : MonoBehaviour
    {
        public bool isPlayerInBackDoorArea;
        
        private void OnTriggerEnter(Collider other)
        {
            if(other.CompareTag("Player"))
                isPlayerInBackDoorArea = true;
        }

        private void OnTriggerExit(Collider other)
        {
            if (other.CompareTag("Player")) 
                isPlayerInBackDoorArea = false;
        }
    }
}