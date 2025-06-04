using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.Events;

public class QuestSystem : MonoBehaviour
{
    [SerializeField] private TMP_Text _questText;
    [SerializeField] private Quest[] _questList;
    public UnityEvent OnAllQuestCompleted;

    private void Start() => StartCoroutine(DoAllQuests());

    private IEnumerator DoAllQuests()
    {
        foreach (var quest in _questList)
        {
            yield return quest.DoQuest(this);
        }

        _questText.text = "All missions completed!";
        OnAllQuestCompleted.Invoke();
    }

    public void Notify(string message) => _questText.text = message;
}
