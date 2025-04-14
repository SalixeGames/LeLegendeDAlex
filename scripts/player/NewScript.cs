using Godot;
using System;

public partial class NewScript : Node
{
    [Export] private int _givenInt;
    
    public override void _Ready()
    {
        base._Ready();
        GD.Print("Hello From The Other Side!\nYou have chosen " + _givenInt + " as a number");
    }
}
