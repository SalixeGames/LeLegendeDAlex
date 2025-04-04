class_name EnemyStateFollow extends EnemyState


@onready var enemy_state_return_to_base: EnemyStateReturnToBase = $"../EnemyStateReturnToBase"
@onready var enemy_state_attack: EnemyStateAttack = $"../EnemyStateAttack"

@export var acceleration : float = 1.3


func enter() -> void:
	controller.update_anim("walk")
	
func exit() -> void:
	pass
	
func process(_delta : float) -> EnemyState:
	if return_to_base():
		return enemy_state_return_to_base
	
	var follow_position : Vector2 = controller.bodies_in_vision[0].position
	if controller.position.distance_to(follow_position) < 80:
		return enemy_state_attack
	set_direction(follow_position)
	
	var speed_factor : float = controller.movement_speed * acceleration
	controller.velocity = controller.direction * speed_factor
	
	if controller.set_direction():
		controller.update_anim("walk") 
		
	return null

func set_direction(follow_position : Vector2) -> void:
	var dir_to_follow : Vector2 = follow_position - controller.position
	controller.direction = dir_to_follow.normalized()

func return_to_base() -> bool:
	var vector_to_base = (controller.position - controller.spawn_position)
	var base_too_far = vector_to_base.length() > controller.roaming_radius
	
	var player_in_sight = not controller.bodies_in_vision.is_empty()
	
	return base_too_far or not player_in_sight
	
func physics(_delta : float) -> EnemyState:
	return null
