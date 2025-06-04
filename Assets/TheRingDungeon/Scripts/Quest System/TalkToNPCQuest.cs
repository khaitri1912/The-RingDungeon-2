using System.Collections;
using UnityEngine;

[CreateAssetMenu(fileName = "TalkToNPCQuest", menuName = "Quests/Talk to NPC")]
public class TalkToNPCQuest : Quest
{
    public string npcName;

    public override IEnumerator DoQuest(QuestSystem questSystem)
    {
        questSystem.Notify($"Talk to {npcName}");

        bool isTalked = false;

        // Tìm NPC theo tên
        DialogNPC[] allNPCs = GameObject.FindObjectsOfType<DialogNPC>();
        DialogNPC targetNPC = null;

        foreach (var npc in allNPCs)
        {
            if (npc.name == npcName)
            {
                targetNPC = npc;
                break;
            }
        }

        if (targetNPC == null)
        {
            Debug.LogError("Không tìm thấy NPC có tên: " + npcName);
            yield break;
        }

        // Khi NPC được nói chuyện -> gọi callback
        UnityEngine.Events.UnityAction onTalked = () => { isTalked = true; };
        targetNPC.OnTalked.AddListener(onTalked);

        // Chờ tới khi player nói chuyện với NPC
        yield return new WaitUntil(() => isTalked);

        // Bỏ listener để tránh bug
        targetNPC.OnTalked.RemoveListener(onTalked);
    }
}