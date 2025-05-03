class_name StateWalk extends State


@export var move_speed : float = 100.0

@onready var idle: State = $"../StateIdle"
@onready var attack: StateAttack = $"../StateAttack"


func enter() -> void:
	controller.update_anim("walk")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> State:
	if controller.direction == Vector2.ZERO:
		return idle
	
	controller.velocity = controller.direction * move_speed
	
	if controller.set_direction():
		controller.update_anim("walk")
	
	return null
	
func physics(_delta : float) -> State:
	return null

func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
