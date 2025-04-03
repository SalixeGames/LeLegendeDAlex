class_name EnemyStateWalk extends EnemyState


@export var move_speed : float = 50.0

@onready var enemy_state_return_to_base: EnemyStateReturnToBase = $"../EnemyStateReturnToBase"
@onready var enemy_state_follow: EnemyStateFollow = $"../EnemyStateFollow"


func enter() -> void:
	controller.update_anim("walk")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> EnemyState:
	if return_to_base():
		return enemy_state_return_to_base
	elif not controller.bodies_in_vision.is_empty():
		return enemy_state_follow
	elif controller.dir_change_timer >= 5 or controller.velocity == Vector2.ZERO:
		controller.direction = Vector2i.DOWN if randi() % 2 else Vector2i.RIGHT
		controller.direction *= -1 if randi() % 2 else 1
		controller.dir_change_timer = 0.0
	controller.direction = controller.direction.normalized()
	
	controller.velocity = controller.direction * move_speed
	
	if controller.set_direction():
		controller.update_anim("walk") 
		
	return null

func return_to_base() -> bool:
	var vector_to_base = (controller.position - controller.spawn_position)
	var base_too_far = vector_to_base.length() > controller.roaming_radius
	
	return base_too_far
	
func physics(_delta : float) -> EnemyState:
	return null
