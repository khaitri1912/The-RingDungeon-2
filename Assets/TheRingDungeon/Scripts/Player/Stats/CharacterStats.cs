using UnityEngine;
using System;


public class CharacterStats : MonoBehaviour
{
    public static CharacterStats Instance;

    public event Action OnStatsChanged;

    [Header("Base Stats")]
    public int strength = 10;        // Tăng sát thương vật lý (auto attack)
    public int intelligence = 5;     // Tăng sát thương kỹ năng (phép)
    public int vitality = 8;         // Tăng lượng máu tối đa
    public int wisdom = 6;           // Tăng lượng mana tối đa

    [Header("Derived Stats (Read Only)")]
    public int MaxHP => vitality * 20;
    public int MaxMana => wisdom * 15;
    public int PhysicalDamage => strength * 2;
    public int MagicDamage => intelligence * 3;

    private void Awake()
    {
        Instance = this;
    }
    public void IncreaseAllStatsBy(int amount)
    {
        strength += amount;
        intelligence += amount;
        vitality += amount;
        wisdom += amount;

        OnStatsChanged?.Invoke();
    }

    public void ApplyModifier(StatModifier modifier)
    {
        strength += modifier.strength;
        intelligence += modifier.intelligence;
        vitality += modifier.vitality;
        wisdom += modifier.wisdom;
        OnStatsChanged?.Invoke();
    }

    public void RemoveModifier(StatModifier modifier)
    {
        strength -= modifier.strength;
        intelligence -= modifier.intelligence;
        vitality -= modifier.vitality;
        wisdom -= modifier.wisdom;

        OnStatsChanged?.Invoke();
    }
}
