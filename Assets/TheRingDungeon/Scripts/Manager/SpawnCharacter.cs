using UnityEngine;

public class SpawnCharacter : MonoBehaviour
{
    [SerializeField] Vector3 spawnPos;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        SpawnChar();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void SpawnChar()
    {
        Instantiate(CharactersUI.Instance.selectedChar, spawnPos, Quaternion.identity);
    }
}
