using UnityEngine;

public class GameMenuPopup : BasePopup
{
    public override void Initialize()
    {
        base.Initialize();
        GameMenuManager.Instance.onCloseUIMenu += Close;
    }

    public override void Close()
    {
        base.Close();
    }
}
