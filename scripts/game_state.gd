extends Node2D

#autoload

enum SwordState {
	noob, medium, strong, expert
}

var sword_state : SwordState = SwordState.medium

func get_sword_state() -> SwordState:
	return sword_state
