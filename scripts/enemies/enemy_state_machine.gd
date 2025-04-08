class_name EnemyStateMachine extends Node

var states : Array[EnemyState]
var prev_state : EnemyState
var current_state : EnemyState

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	change_state(current_state.process(delta))

func _physics_process(delta: float) -> void:
	change_state(current_state.physics(delta))

func initialize(_controller : CharacterBody2D) -> void:
	states = []
	
	for child in get_children():
		if child is EnemyState:
			states.append(child)
	if states.size():
		change_state(states[1])
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state(new_state : EnemyState) -> void:
	if new_state && new_state != current_state:
		if current_state:
			current_state.exit()
		
		prev_state = current_state
		current_state = new_state
		current_state.enter()
