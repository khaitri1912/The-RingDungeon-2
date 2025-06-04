using UnityEngine;

[CreateAssetMenu(fileName = "New Item", menuName = "Item/Create New Item")]
public class Item : ScriptableObject
{

    public int id;
    public string itemName;
    public int value;
    public Sprite icon;

    public ItemCategory category;
    public WeaponType weaponType;
    public ArmorType armorType;
    public ConsumableType consumableType;
    public int restoreAmount;


    public enum ItemCategory
    {
        Weapon,
        Armor,
        Consumable,
    }
    public enum WeaponType
    {
        Sword,
        Axe
    }
    public enum ArmorType
    {
        Shirt1,
        Shirt2
    }
    public enum ConsumableType
    {
        None,
        HP_Potion,
        MP_Potion
    }
}
