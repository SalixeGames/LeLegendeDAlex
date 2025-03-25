extends Node2D

#autoload

enum SwordState {
	noob, medium, strong, expert
}

var sword_state : SwordState = SwordState.noob

func get_sword_state() -> SwordState:
	return sword_state

func update_sword_state(state : SwordState) -> void:
	sword_state = state
