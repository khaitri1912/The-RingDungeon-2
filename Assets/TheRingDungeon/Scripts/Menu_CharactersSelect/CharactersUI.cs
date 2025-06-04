using System;
using System.Collections.Generic;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class CharactersUI : MonoBehaviour
{
    public static CharactersUI Instance;
    public string parentCharList = "CharactersContainer";
    public CharactersSelect charListData;
    public List<Texture> characterTextureList;
    public List<GameObject> characterAvtList;
    public Texture charTexture;
    public GameObject selectedChar;
    public int numOfChar;

    private void Awake()
    {
        Instance = this;
    }

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        characterTextureList = new List<Texture>();
        if (charListData != null)
        {
            characterTextureList = new List<Texture>(charListData.list.Select(x => x.characterTexture));
        }
        if (charListData !=  null)
        {
                characterAvtList = new List<GameObject>(charListData.list.Select(x => x.characterAvatar));
        }
        if (charTexture != null)
        {
            return;
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void CheckCharacterTexture(Texture chosenChar)
    {
        int index = 0;
        charTexture = chosenChar;
        foreach (Texture tex in characterTextureList)
        {
            if (tex.name == charTexture.name)
            {
                Debug.Log("Da chon nhan vat thu: " + (index+1) + " trong danh sach " + tex.name);
                numOfChar = index;
                return;
            }
            index++;
        }
    }

    public void GetCharacter()
    {
        var selected = characterAvtList
                       .Select((value, i) => new { GameObject = value, i })
                       .FirstOrDefault(x => x.i == numOfChar);

        GameObject chosenCharacter = selected?.GameObject;

        if (chosenCharacter != null)
        {
            Debug.Log("Đã xác định nhân vật: " + chosenCharacter.name);
        }
        else
        {
            Debug.LogWarning("Không tìm thấy nhân vật.");
        }

        selectedChar = chosenCharacter;
    }
}
