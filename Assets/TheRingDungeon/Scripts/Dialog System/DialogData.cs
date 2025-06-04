using UnityEngine;

[CreateAssetMenu(fileName = "NewDialogData", menuName = "Game Data/Dialog Data")]
public class DialogData : ScriptableObject
{
    [TextArea(3, 10)]
    public string[] dialogLines;
}
