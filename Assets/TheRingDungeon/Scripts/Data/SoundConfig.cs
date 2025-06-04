using UnityEngine;

[CreateAssetMenu(fileName = "SoundConfig", menuName = "TheRingDungeon/Config/SoundConfig")]
public class SoundConfig : ScriptableObject
{
    public AudioClip backgroundMusic;
    public AudioClip vfx_attack;
    public AudioClip vfx_move;
}
