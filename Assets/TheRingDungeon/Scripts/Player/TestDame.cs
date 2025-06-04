using UnityEngine;

public class TestDamage : MonoBehaviour
{
    public PlayerStats playerStats;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.T)) // Nhấn phím T để test
        {
            if (playerStats != null)
            {
                playerStats.TakeDamage(10);
            }
        }

        if (Input.GetKeyDown(KeyCode.H)) // Nhấn phím T để test
        {
            if (playerStats != null)
            {
                playerStats.Heal(5);
            }
        }
    }
}
