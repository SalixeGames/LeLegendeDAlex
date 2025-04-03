class_name EnemyStateReturnToBase extends EnemyState


@export var move_speed : float = 50.0
@export var rot_angle : float = PI/2

@onready var enemy_state_walk: EnemyStateWalk = $"../EnemyStateWalk"
@onready var controller: BaseEnemy = $"../.."

var base : Vector2
var min_distance : float

func enter() -> void:
	controller.update_anim("walk")
	base = controller.spawn_position
	min_distance = controller.roaming_radius
	
func exit() -> void:
	pass
	
func process(delta : float) -> EnemyState:
	var distance_to_base : float = controller.position.distance_to(base)
	if distance_to_base < min_distance - 10:
		return enemy_state_walk
	
	set_direction(delta)
	
	controller.velocity = controller.direction * move_speed
	
	if controller.set_direction():
		controller.update_anim("walk") 

	return null

func set_direction(delta : float) -> void:
	var dir_to_base : Vector2 = controller.position - base
	var angle_to_base : float = controller.direction.angle_to(dir_to_base)
	
	var rot_direction : int = 1
	if angle_to_base > 0:
		rot_direction = -1
		
	var rotation_angle = rot_direction * rot_angle * delta
	controller.direction = controller.direction.rotated(rotation_angle)

func rotate_vector(vector : Vector2, angle : float) -> Vector2:
	var new_vector : Vector2 = Vector2.ZERO
	
	new_vector.x = (vector.x * cos(angle)) - (vector.y * sin(angle))
	new_vector.y = (vector.x * sin(angle)) + (vector.y * cos(angle))
	
	return new_vector
	
func physics(_delta : float) -> EnemyState:
	return null
