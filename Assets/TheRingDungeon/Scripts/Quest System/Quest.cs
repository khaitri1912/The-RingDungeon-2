using UnityEngine;
using System.Collections;

public abstract class Quest : ScriptableObject
{
    public abstract IEnumerator DoQuest(QuestSystem questSystem);
}
