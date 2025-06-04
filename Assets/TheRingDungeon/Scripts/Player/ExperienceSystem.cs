using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UI;
public class ExperienceSystem : MonoBehaviour
{
    public int currentLevel = 1;
    public int currentExp = 0;
    public int expToLevelUp = 100;
    public int expIncreaseFactor = 2;

    public Slider expBarSlider;
    public Text levelText2D;


    private CharacterStats characterStats;

    void Start()
    {
        characterStats = GetComponent<CharacterStats>();
        UpdateUI();
    }

    void Update()
    {
        UpdateUI();
    }

    private void GainExperienceFromEnemy(int amount)
    {
        GainExperience(amount);
    }

    private void GainExperience(int amount)
    {
        currentExp += amount;
        while(currentExp >= expToLevelUp)
        {
            LevelUp();
        }
        UpdateUI();
    }

    private void LevelUp()
    {
        currentLevel++;
        currentExp -= expToLevelUp;
        expToLevelUp *= expIncreaseFactor;

        if (characterStats != null)
        {
            characterStats.IncreaseAllStatsBy(1);
            CharacterStatsUI statsUI = FindObjectOfType<CharacterStatsUI>();
            if (statsUI != null)
            {
                statsUI.UpdateStatUI();
            }
            PlayerStats playerStats = GetComponent<PlayerStats>();
            if (playerStats != null)
                playerStats.OnStatsChanged();
        }
        UpdateUI();
    }
    private void UpdateUI()
    {
        if(expBarSlider != null)
        {
            expBarSlider.maxValue = expToLevelUp;
            expBarSlider.value = currentExp;
        }

        if(levelText2D != null) 
        {
            levelText2D.text = currentLevel.ToString();
        }
    }
}
