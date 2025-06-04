using TheRingDungeon.Data;
using UnityEngine;
using UnityEngine.UI;
public class InventoryItemController : MonoBehaviour
{
    public PlayerStats playerStats;

    Item item;

    public void RemoveItem()
    {
        UserDataManager.Instance.RemoveItemFromInventory(item);
        Destroy(gameObject);
    }
    public void AddItem(Item newItem)
    {
        item = newItem;
    }

    public void UseItem()
    {
        if (item.category == Item.ItemCategory.Weapon)
        {
            SwapWeapon.Instance?.ToggleWeapon(item.weaponType);
        }
        else if (item.category == Item.ItemCategory.Consumable)
        {
            switch (item.consumableType)
            {
                case Item.ConsumableType.HP_Potion:
                    playerStats?.Heal(item.restoreAmount);
                    break;
                case Item.ConsumableType.MP_Potion:
                    playerStats?.RestoreMana(item.restoreAmount);
                    break;
            }

            RemoveItem(); // Xóa item sau khi dùng
        }

    }
}
