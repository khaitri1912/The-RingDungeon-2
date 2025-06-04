using UnityEngine;

[System.Serializable]
public struct StatModifier
{
    public int strength;
    public int intelligence;
    public int vitality;
    public int wisdom;

    public StatModifier(int strength, int intelligence, int vitality, int wisdom)
    {
        this.strength = strength;
        this.intelligence = intelligence;
        this.vitality = vitality;
        this.wisdom = wisdom;
    }

    public static StatModifier Zero => new StatModifier(0, 0, 0, 0);
}
