using UnityEngine;

public class Actor : MonoBehaviour
{
    public int maxHealth;

    public int experienceValue = 50;
    public int currentHealth { get; private set; }

    private void Awake()
    {
        currentHealth = maxHealth;
    }

    public void TakeDame(int amount)
    {
        currentHealth -= amount;
        if(currentHealth <= 0)
        {
            Death();
        }
    }

    public void Death()
    {
        GameObject player = GameObject.FindGameObjectWithTag("Player");
        if(player != null)
        {
            player.SendMessage("GainExperienceFromEnemy", experienceValue);
        }
        Destroy(gameObject, 0.5f);
    }
}
