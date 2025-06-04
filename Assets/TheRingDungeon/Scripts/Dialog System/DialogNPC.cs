using UnityEngine;
using UnityEngine.Events;

public class DialogNPC : MonoBehaviour
{
    public DialogData dialogData; // Gán file S.O. ch?a h?i tho?i
    public DialogManager dialogManager; // Gán reference t?i DialogManager trong scene

    public UnityEvent OnTalked;
    private bool isInteracting = false;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isInteracting = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isInteracting = false;
        }
    }

    private void Update()
    {
        if (isInteracting && Input.GetKeyDown(KeyCode.Space))
        {
            dialogManager.ShowMessage(dialogData);
            OnTalked?.Invoke();
        }
    }
}
