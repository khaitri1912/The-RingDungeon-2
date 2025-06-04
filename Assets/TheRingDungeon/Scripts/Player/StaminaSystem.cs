using UnityEngine;
using UnityEngine.UI;

public class StaminaSystem : MonoBehaviour
{
    [Header("Stamina Setting")]
    public float maxStamina = 100f;
    public float currentStamina;
    public float dashCost = 30f;
    public float regenRate = 10f;

    [Header("UI")]
    public Slider staminaBar;

    private void Start()
    {
        currentStamina = maxStamina;
        UpdateUI();
    }

    private void Update()
    {
        RegenStamina();
        UpdateUI();
    }

    void RegenStamina()
    {
        if(currentStamina < maxStamina)
        {
            currentStamina += regenRate * Time.deltaTime;
            //tr? v? giá tr? nh? h?n
            currentStamina = Mathf.Min(currentStamina, maxStamina);
        }
    }

    public bool CanDash()
    {
        return currentStamina >= dashCost;
    }

    public void UseStamina()
    {
        currentStamina -= dashCost;
        // gi? nguyên giá tr? trong kho?ng t? 0 t?i max
        currentStamina = Mathf.Clamp(currentStamina, 0, maxStamina);
    }
    void UpdateUI()
    {
        if(staminaBar != null)
        {
            staminaBar.value = currentStamina / maxStamina;
        }
    }
}
