using System;
using System.Collections.Generic;
using TheRingDungeon.Data;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameMenuManager : BaseSingleton<GameMenuManager>
{
    public event Action onCloseUIMenu;
    public event Action<MenuTabs> onMenuTabClick;

    protected override void Awake()
    {
        base.Awake();
        UIManager.Instance.ShowPopup<GameMenuPopup>("GameMenuPopup");
    }

    public void OnReceiveBtnClicked(MenuTab tab)
    {
        switch (tab)
        {
            case MenuTab.ContinueGame:
                {
                    UserDataManager.Instance.GetDataFromJson();
                    LoadSceneAdditive("PlayerMovement");
                    onCloseUIMenu?.Invoke();
                    break;
                }
            case MenuTab.NewGame:
                {
                    LoadScene("Character Select");
                    break;
                }
            case MenuTab.Options:
                {
                    UIManager.Instance.ShowPopup<GameSettingPopup>("GameSettingPopup");
                    break;
                }
            case MenuTab.Credit:
                {
                    break;
                }
            case MenuTab.QuitGame:
                {
                    break;
                }
            case MenuTab.Play:
                {
                    LoadScene("Tutorial");
                    break;
                }
            default:break;
        }
    }

    public void LoadSceneAdditive(string sceneName)
    {
        SceneManager.LoadScene(sceneName, LoadSceneMode.Additive);
    }

    public void LoadScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }
}
