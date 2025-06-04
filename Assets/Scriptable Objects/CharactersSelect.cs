using NUnit.Framework;
using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "CharactersSelect", menuName = "Scriptable Objects/CharactersSelect")]
public class CharactersSelect : ScriptableObject
{
    [SerializeField] public List<CharacterListData> list;
}
