class_name EnemyStateWalk extends EnemyState


@export var move_speed : float = 50.0

@onready var enemy_state_idle: EnemyStateIdle = $"../EnemyStateIdle"
@onready var controller: BaseEnemy = $"../.."


func enter() -> void:
	controller.update_anim("walk")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> EnemyState:
	controller.velocity = controller.direction * move_speed
	
	if controller.set_direction():
		controller.update_anim("walk") 
	
	return null
	
func physics(_delta : float) -> EnemyState:
	return null
