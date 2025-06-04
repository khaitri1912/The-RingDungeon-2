using UnityEngine;

namespace TheRingDungeon.Data
{
    public class UserDataManager : BaseSingleton<UserDataManager>
    {
        public UserData data;
        public InventoryManager inventoryManager;
        [SerializeField] SaveLoadSystem saveLoadTask;

        public void AddItemToInventory(Item item)
        {
            data.userData.items.Add(item);
            inventoryManager.Add(item);
        }

        public void RemoveItemFromInventory(Item item)
        {
            inventoryManager.Remove(item);
        }

        public async void GetDataFromJson()
        {
            saveLoadTask.SetFilePath();
            data.Reset();
            await saveLoadTask.LoadGameAsync();
        }

        private async void Update()
        {
            if (Input.GetKeyDown(KeyCode.F5))
            {
                await saveLoadTask.SaveGameAsync();
            }
            if (Input.GetKeyDown(KeyCode.F6))
            {
                GetDataFromJson();
            }
        }
    }
}
