class_name EnemyStateIdle extends EnemyState

@onready var enemy_state_walk: EnemyStateWalk = $"../EnemyStateWalk"

func enter() -> void:
	controller.update_anim("idle")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> EnemyState: 
	if controller.direction != Vector2.ZERO:
		return enemy_state_walk
	controller.velocity = Vector2.ZERO
	return null
	
func physics(_delta : float) -> EnemyState:
	return null
