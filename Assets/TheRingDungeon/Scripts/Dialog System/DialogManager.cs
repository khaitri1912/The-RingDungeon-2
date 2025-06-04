using TMPro;
using UnityEngine;
using UnityEngine.Serialization;

public class DialogManager : MonoBehaviour
{
    [FormerlySerializedAs("text")]
    public TMP_Text Text;
    public GameObject DialogSystem;

    [SerializeField]
    private TextScrollingEffect _effect;

    private string[] _words;
    private int _currentLine;

    public void ShowMessage(DialogData dialogData)
    {
        _currentLine = 0;
        _words = dialogData.dialogLines;
        DialogSystem.SetActive(true);
        Skip();
    }

    public void Skip()
    {
        if (_currentLine < _words.Length)
        {
            _effect.Play(_words[_currentLine], 2);
            _currentLine += 1;
        }
        else
        {
            _currentLine = 0;
            DialogSystem.SetActive(false);
        }
    }
}
