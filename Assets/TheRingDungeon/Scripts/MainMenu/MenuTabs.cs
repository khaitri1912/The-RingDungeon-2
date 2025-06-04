using UnityEngine;
using UnityEngine.UI;
using VContainer;

public class MenuTabs : MonoBehaviour
{
    [SerializeField] private MenuTab tab;  
    [SerializeField] private Button button; 

    private void Start()
    {
        button.onClick.AddListener(HandleTabClick);
    }

    private void HandleTabClick()
    {
        GameMenuManager.Instance.OnReceiveBtnClicked(tab);
    }
}
public enum MenuTab
{
    ContinueGame,
    NewGame,
    Options,
    Credit,
    QuitGame,
    Play
}
