using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

public class HoverCharsEffect : MonoBehaviour
{
    /*public Vector3 hoverScale = new Vector3 (180, 180, 180);
    public float hoverSize = 5f;
    public Transform[] chars;
    public int currentIndex = 0;
    public float spacing = 2.5f;
    public float moveSpeed = 5f;
    public Vector3 centerPos = Vector3.zero;
    public CharactersUI charUI;*/

    public static HoverCharsEffect hoverCharsEffect;

    public Vector2 hoverSize = new Vector2(200,200);
    private Vector2 originalSize;
    private Vector2 targetSize;
    private RawImage rawImage;
    public Texture currentTexture;
    private Texture chosenTexture;

    private void Start()
    {
        rawImage = GetComponent<RawImage>();
        currentTexture = null;
        originalSize = rawImage.rectTransform.sizeDelta;
        targetSize = originalSize;
    }

    private void Update()
    {
        rawImage.rectTransform.sizeDelta = Vector2.Lerp(rawImage.rectTransform.sizeDelta, targetSize, Time.deltaTime * 5f);
    }

    public void PointerEnter()
    {
        targetSize = hoverSize;
    }

    public void PointerExit()
    {
        targetSize = originalSize;
    }

    public void PointerClick()
    {
        currentTexture = rawImage.texture;
        CharactersUI.Instance.CheckCharacterTexture(currentTexture);
    }
}
