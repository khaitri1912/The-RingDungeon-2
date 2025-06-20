using System;
using UnityEngine;

[Serializable]
public class PlayerDashData
{
    [field: SerializeField][field: Range(1f, 3f)] public float SpeedModifier { get; private set; } = 2f;
    [field: SerializeField] public PlayerRotationData RotationData { get; private set; }
}
