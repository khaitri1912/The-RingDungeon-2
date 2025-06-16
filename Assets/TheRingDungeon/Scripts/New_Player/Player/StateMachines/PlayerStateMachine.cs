using UnityEngine;

public class PlayerStateMachine : StateMachine
{
    public Player Player { get; }
    public PlayerIdlingState IdlingState { get; }
    public PlayerRunningState RunningState { get; }

    public PlayerDashingState DashingState { get; }

    public PlayerMediumStoppingState MedianStoppingState { get; }
    public PlayerHardStoppingState HardStoppingState { get; }

    public PlayerStateMachine(Player player)
    {
        Player = player;

        IdlingState = new PlayerIdlingState(this);
        RunningState = new PlayerRunningState(this);
        DashingState = new PlayerDashingState(this);

        MedianStoppingState = new PlayerMediumStoppingState(this);
        HardStoppingState = new PlayerHardStoppingState(this);
    }
}
