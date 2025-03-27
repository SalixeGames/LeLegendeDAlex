class_name StateMachine extends Node

var states : Array[State]
var prev_state : State
var current_state : State

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	change_state(current_state.process(delta))

func _physics_process(delta: float) -> void:
	change_state(current_state.physics(delta))

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))

func initialize(_controller : CharacterBody2D) -> void:
	states = []
	
	for child in get_children():
		if child is State:
			states.append(child)
	
	if states.size():
		states[0].controller = _controller
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state(new_state : State) -> void:
	if new_state && new_state != current_state:
		if current_state:
			current_state.exit()
		
		prev_state = current_state
		current_state = new_state
		current_state.enter()
