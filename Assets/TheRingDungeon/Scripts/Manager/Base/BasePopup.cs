using UnityEngine;

public abstract class BasePopup : MonoBehaviour
{
    public virtual void Initialize() { }

    public virtual void Close()
    {
        gameObject.SetActive(false);
    }

}
