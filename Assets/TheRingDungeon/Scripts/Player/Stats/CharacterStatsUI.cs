using UnityEngine;
using TMPro; // Nếu dùng TextMeshPro
using UnityEngine.UI;
using UnityEngine;
using TMPro;

public class CharacterStatsUI : MonoBehaviour
{
    public static CharacterStatsUI Instance;

    public CharacterStats characterStats;

    [Header("Stat Text Fields")]
    public TextMeshProUGUI strengthText;
    public TextMeshProUGUI intelligenceText;
    public TextMeshProUGUI vitalityText;
    public TextMeshProUGUI mindText;

    [Header("Panel Control")]
    public GameObject statsPanel; // Gán panel chứa các Text chỉ số vào đây

    [Header("Equipped Weapon")]
    public Image weaponIconImage;

    private void Awake()
    {
        Instance = this;
    }
    private void Start()
    {
        if (characterStats == null)
            characterStats = CharacterStats.Instance;

        if (characterStats != null)
            characterStats.OnStatsChanged += UpdateStatUI;

        UpdateStatUI();

        if (statsPanel != null)
            statsPanel.SetActive(false);
    }

    private void OnDestroy()
    {
        if (characterStats != null)
            characterStats.OnStatsChanged -= UpdateStatUI;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.I))
        {
            if (statsPanel != null)
                statsPanel.SetActive(!statsPanel.activeSelf);
        }
    }

    public void UpdateStatUI()
    {
        if (characterStats == null) return;

        strengthText.text = "Strength: " + characterStats.strength;
        intelligenceText.text = "Intelligence: " + characterStats.intelligence;
        vitalityText.text = "Vitality: " + characterStats.vitality;
        mindText.text = "Mind: " + characterStats.wisdom;
    }

    public void UpdateWeaponIcon(Sprite icon)
    {
        if (weaponIconImage != null)
        {
            if (icon == null)
            {
                weaponIconImage.enabled = false;
            }
            else
            {
                weaponIconImage.sprite = icon;
                weaponIconImage.enabled = true;
            }
        }
    }
}

