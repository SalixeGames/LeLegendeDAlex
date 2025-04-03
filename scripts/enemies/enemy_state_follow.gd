class_name EnemyStateFollow extends EnemyState


@export var move_speed : float = 50.0

@onready var controller: BaseEnemy = $"../.."
@onready var enemy_state_return_to_base: EnemyStateReturnToBase = $"../EnemyStateReturnToBase"


func enter() -> void:
	controller.update_anim("walk")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> EnemyState:
	if return_to_base():
		return enemy_state_return_to_base
	
	set_direction()
	
	controller.velocity = controller.direction * move_speed * 1.3
	
	if controller.set_direction():
		controller.update_anim("walk") 
		
	return null

func set_direction() -> void:
	var follow_position = controller.bodies_in_vision[0].position
	var dir_to_follow : Vector2 = follow_position - controller.position
	controller.direction = dir_to_follow.normalized()

func return_to_base() -> bool:
	var vector_to_base = (controller.position - controller.spawn_position)
	var base_too_far = vector_to_base.length() > controller.roaming_radius
	
	var player_in_sight = not controller.bodies_in_vision.is_empty()
	
	return base_too_far or not player_in_sight
	
func physics(_delta : float) -> EnemyState:
	return null
