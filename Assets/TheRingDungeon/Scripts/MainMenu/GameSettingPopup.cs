using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameSettingPopup : BasePopup
{
    [SerializeField] Button closeButton;
    [SerializeField] Button gameTab;
    [SerializeField] Button imageTab;
    [SerializeField] Button soundTab;
    [SerializeField] Button keyTab;
    public override void Initialize()
    {
        base.Initialize();
        RegisterEvent();
    }

    private void RegisterEvent()
    {
        closeButton.onClick.AddListener(Close);
    }

    public override void Close()
    {
        base.Close();
    }

    private void ShowContentByTab(GameSettingTabs tab)
    {

    }
}

public enum GameSettingTabs
{
    Game,
    Image,
    Sound,
    Key
}
