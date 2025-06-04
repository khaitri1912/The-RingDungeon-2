using UnityEngine;
using System.Collections.Generic;
using System;
using Unity;
using UnityEngine.UI;

[Serializable]
public class CharacterListData
{
    [SerializeField] public GameObject characterAvatar;
    [SerializeField] public string characterName;
    [SerializeField] public Texture characterTexture;
}
