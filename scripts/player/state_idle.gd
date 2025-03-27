class_name StateIdle extends State


@onready var walk: State = $"../StateWalk"
@onready var attack: StateAttack = $"../StateAttack"


func enter() -> void:
	controller.update_anim("idle")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> State:
	if controller.direction != Vector2.ZERO:
		return walk
	controller.velocity = Vector2.ZERO
	return null
	
func physics(_delta : float) -> State:
	return null

func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
