using UnityEngine;

public class PlayerStateMachine : StateMachine
{
    public Player Player { get; }
    public PlayerIdlingState IdlingState { get; }
    public PlayerRunningState RunningState { get; }

    public PlayerDashingState DashingState { get; }

    public PlayerStateMachine(Player player)
    {
        Player = player;

        IdlingState = new PlayerIdlingState(this);
        RunningState = new PlayerRunningState(this);
        DashingState = new PlayerDashingState(this);
    }
}
