using TMPro;
using UnityEngine;

public class SwapWeapon : MonoBehaviour
{
    public static SwapWeapon Instance;

    [Header("Weapon Objects")]
    public GameObject swordObject;
    public GameObject axeObject;

    private string currentWeapon = "";

    [Header("Weapon Icons")]
    public Sprite swordIcon;
    public Sprite axeIcon;

    // + stat item
    private readonly StatModifier swordModifier = new StatModifier(2, 0, 0, 0); // +2 strength
    private readonly StatModifier axeModifier = new StatModifier(3, 0, 0, 0);   // +3 strength
    private void Awake()
    {
        Instance = this;
    }

    public string GetCurrentWeapon()
    {
        return currentWeapon;
    }

    public void ToggleWeapon(Item.WeaponType weaponType)
    {
        switch (weaponType)
        {
            case Item.WeaponType.Sword:
                if (currentWeapon == "Sword")
                {
                    swordObject.SetActive(false);
                    currentWeapon = "";
                    CharacterStatsUI.Instance?.UpdateWeaponIcon(null);
                    CharacterStats.Instance?.RemoveModifier(swordModifier);
                }
                else
                {
                    swordObject.SetActive(true);
                    axeObject.SetActive(false);

                    if (currentWeapon == "Axe") CharacterStats.Instance?.RemoveModifier(axeModifier);
                    CharacterStats.Instance?.ApplyModifier(swordModifier);

                    currentWeapon = "Sword";
                    CharacterStatsUI.Instance?.UpdateWeaponIcon(swordIcon);
                }
                break;

            case Item.WeaponType.Axe:
                if (currentWeapon == "Axe")
                {
                    axeObject.SetActive(false);
                    currentWeapon = "";
                    CharacterStats.Instance?.RemoveModifier(axeModifier);
                    CharacterStatsUI.Instance?.UpdateWeaponIcon(null);
                }
                else
                {
                    axeObject.SetActive(true);
                    swordObject.SetActive(false);

                    if (currentWeapon == "Sword") CharacterStats.Instance?.RemoveModifier(swordModifier);
                    CharacterStats.Instance?.ApplyModifier(axeModifier);
                    CharacterStatsUI.Instance?.UpdateWeaponIcon(axeIcon);
                    currentWeapon = "Axe";
                }
                break;
        }
    }
}
