using TheRingDungeon.Data;
using UnityEngine;

public enum InteractableType { Enemy, Item}
public class Interactable : MonoBehaviour
{
    public Item itemData;
    public Actor myActor { get; private set; }
    public InteractableType interactionType;

    private void Awake()
    {
        if(interactionType == InteractableType.Enemy)
        {
            myActor = GetComponent<Actor>();
        }
    }

    public void InteractWithItem()
    {
        if (itemData != null)
        {
            UserDataManager.Instance.AddItemToInventory(itemData);// Thêm vào inventory
        }
        Destroy(gameObject);
    }
}
