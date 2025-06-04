using DG.Tweening;
using System.Collections;
using TMPro;
using UnityEngine;

public class TextScrollingEffect : MonoBehaviour
{
    [SerializeField]
    private TextMeshProUGUI _text;

    public void Play(string endText, float speed)
        => DOTween.To(() => "", x => _text.text = x, endText, speed);
}
