using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(CharacterStats))]
public class PlayerStats : MonoBehaviour
{
    private CharacterStats characterStats;

    [Header("Health Settings")]
    public int currentHealth;
    public Slider healthBar;

    [Header("Mana Settings")]
    public int currentMana;
    public Slider manaBar;

    [Header("UI Text")]
    public Text healthText;
    public Text manaText;

    private void Start()
    {
        characterStats = GetComponent<CharacterStats>();

        currentHealth = characterStats.MaxHP;
        currentMana = characterStats.MaxMana;

        if (healthBar != null)
            healthBar.maxValue = characterStats.MaxHP;

        if (manaBar != null)
            manaBar.maxValue = characterStats.MaxMana;

        UpdateHealthUI();
        UpdateManaUI();
    }

    public void TakeDamage(int damage)
    {
        currentHealth = Mathf.Max(currentHealth - damage, 0);
        UpdateHealthUI();

        if (currentHealth <= 0)
            Die();
    }

    public void Heal(int value)
    {
        currentHealth = Mathf.Min(currentHealth + value, characterStats.MaxHP);
        UpdateHealthUI();
    }

    public bool UseMana(int amount)
    {
        if (currentMana >= amount)
        {
            currentMana -= amount;
            UpdateManaUI();
            return true;
        }
        return false;
    }

    public void RestoreMana(int amount)
    {
        currentMana = Mathf.Clamp(currentMana + amount, 0, characterStats.MaxMana);
        UpdateManaUI();
    }

    private void Die()
    {
        Debug.Log("Player died!");
        // Thêm animation, disable movement, hoặc reload scene ở đây
    }

    public void UpdateHealthUI()
    {
        if (healthBar != null)
            healthBar.value = currentHealth;

        if (healthText != null)
            healthText.text = $"{currentHealth} / {characterStats.MaxHP}";
    }

    public void UpdateManaUI()
    {
        if (manaBar != null)
            manaBar.value = currentMana;

        if (manaText != null)
            manaText.text = $"{currentMana} / {characterStats.MaxMana}";
    }

    public void OnStatsChanged()
    {
        // Cập nhật max value của thanh máu/mana
        if (healthBar != null)
            healthBar.maxValue = characterStats.MaxHP;

        if (manaBar != null)
            manaBar.maxValue = characterStats.MaxMana;

        // Option: hồi máu/mana đầy khi lên level
        currentHealth = characterStats.MaxHP;
        currentMana = characterStats.MaxMana;

        UpdateHealthUI();
        UpdateManaUI();
    }
}
