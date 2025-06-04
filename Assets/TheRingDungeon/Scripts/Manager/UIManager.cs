using System.Collections.Generic;
using UnityEngine;

public class UIManager : BaseSingleton<UIManager>
{
    private Dictionary<string, GameObject> activePopups = new Dictionary<string, GameObject>();

    private string popupPath = "UI/Popup/";
    [SerializeField] private Transform popupParent;
    [SerializeField] private Transform screenParent;
    public void ShowPopup<T>(string prefabPath) where T : BasePopup
    {
        string path = popupPath + prefabPath;
        if (activePopups.ContainsKey(path))
        {
            GameObject existingPopup = activePopups[path];
            existingPopup.SetActive(true);
            return;  
        }

        GameObject popupPrefab = Resources.Load<GameObject>(path); 
        if (popupPrefab != null)
        {
            GameObject popupObject = Instantiate(popupPrefab, popupParent);
            T popupScript = popupObject.GetComponent<T>();

            activePopups[path] = popupObject;

            if (popupScript != null)
            {
                popupScript.Initialize();  
            }
            else
            {
                Debug.LogError("Popup does not have the correct script attached.");
            }
        }
        else
        {
            Debug.LogError("Popup prefab not found at: " + prefabPath);
        }
    }
    public void CloseAllPopups()
    {
        foreach (Transform child in transform)
        {
            BasePopup popup = child.GetComponent<BasePopup>();
            if (popup != null)
            {
                popup.Close();
            }
        }
    }

}
