using UnityEngine;

public class SoundManager : BaseSingleton<SoundManager>
{
    public SoundConfig soundConfig;
    [SerializeField] AudioSource bgmSource;
    [SerializeField] AudioSource vfxSource;

    public void PlayAudio(AudioType type = AudioType.None, VfxState state = VfxState.none)
    {
        switch (type)
        {
            case AudioType.Bgm:
                {
                    bgmSource.clip = soundConfig.backgroundMusic;
                    bgmSource.Play();
                    break;
                }
            case AudioType.Vfx:
                {
                    SetVfxState(state);
                    break;
                }
            default: break;
        }
    }

    public void SetVfxState(VfxState state)
    {
        if (vfxSource.clip != null)
        {
            StopAudio(vfxSource);
        }
        switch (state)
        {
            case VfxState.attack:
                {
                    vfxSource.clip = soundConfig.vfx_attack;
                    break;
                }
            case VfxState.move:
                {
                    vfxSource.clip = soundConfig.vfx_move;
                    break;
                }
            default: break;
        }
        vfxSource.Play();
    }

    public void StopAudio(AudioSource source)
    {
        source.Stop();
    }
}
public enum AudioType
{
    None,
    Bgm,
    Vfx
}
public enum VfxState
{
    none,
    attack,
    move
}