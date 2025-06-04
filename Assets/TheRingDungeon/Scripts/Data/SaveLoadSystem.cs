using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using UnityEngine;

namespace TheRingDungeon.Data
{
    public class SaveLoadSystem : MonoBehaviour
    {
        public int playerLevel;
        public List<Item> playerItems;
        public Vector3 playerPosition;

        private string filePath;
        public void SetFilePath()
        {
            filePath = Application.persistentDataPath;
        }
        public async Task SaveGameAsync(string fileSave = "/autosave.json")
        {
            string saveFilePath = filePath + fileSave;
            UserSaveData saveData = new UserSaveData();

            saveData = UserDataManager.Instance.data.userData;

            string json = JsonUtility.ToJson(saveData);

            try
            {
                await File.WriteAllTextAsync(saveFilePath, json);
                Debug.Log("Game Saved Successfully");
            }
            catch (System.Exception e)
            {
                Debug.LogError("Failed to save game: " + e.Message);
            }
        }

        public async Task LoadGameAsync(string fileSave = "/autosave.json")
        {
            string saveFilePath = filePath + fileSave;

            UserData userData = UserDataManager.Instance.data;

            if (File.Exists(saveFilePath))
            {
                try
                {
                    string json = await File.ReadAllTextAsync(saveFilePath);

                    UserSaveData loadData = JsonUtility.FromJson<UserSaveData>(json);

                    UserDataManager.Instance.data.userData = loadData;

                    Debug.Log("Game Loaded Successfully");
                }
                catch (System.Exception e)
                {
                    Debug.LogError("Failed to load game: " + e.Message);
                }
            }
            else
            {
                Debug.Log("No saved game found");
            }
        }
    }
}
