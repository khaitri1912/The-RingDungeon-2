using System.Collections.Generic;
using UnityEngine;

namespace TheRingDungeon.Data
{
    [CreateAssetMenu(fileName = "UserData", menuName = "TheRingDungeon/Data/UserData")]
    public class UserData : ScriptableObject
    {
        public UserSaveData userData;
        public void Reset()
        {
            userData.level = 1;
            userData.position = Vector3.zero;
            userData.items.Clear();
        }
    }

    [System.Serializable]
    public class UserSaveData
    {
        public int level;
        public List<Item> items;
        public Vector3 position;
    }
}

