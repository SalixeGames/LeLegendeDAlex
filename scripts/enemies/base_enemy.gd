class_name BaseEnemy extends CharacterBody2D

@export_category("Positioning")
@export var spawn_position : Vector2 = Vector2(0, 0)
@export var roaming_radius : float = 150
@export var movement_speed : float = 50

@export_category("Stats")
@export var health : float = 5.0

@export_category("Vision")
@export var vision_distance : float = 150
@export var vision_angle : float = 100
@onready var vision_shape: CollisionPolygon2D = $Body/Vision/VisionShape
@onready var line_2d: Line2D = $Body/Vision/Line2D

var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.UP
var cardinal_direction_name : String = "up"
var dir_change_timer : float = 6

var bodies_in_vision : Array[CharacterBody2D] = []

@onready var enemy_state_machine: EnemyStateMachine = $EnemyStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var enemy_state_hurt: EnemyStateHurt = $EnemyStateMachine/EnemyStateHurt


func _ready() -> void:
	enemy_state_machine.initialize(self)
	set_fov()
	
func set_fov():
	vision_angle  = deg_to_rad(vision_angle)
	var vision_y_coordinate : float = tan(vision_angle / 2) * vision_distance
	
	vision_shape.set(
		"polygon", 
		PackedVector2Array(
			[
				Vector2.ZERO, 
				Vector2(-vision_y_coordinate, -vision_distance), 
				Vector2(vision_y_coordinate, -vision_distance)]
		)
	)
	
	for point_id in 4:
		line_2d.set_point_position(
			point_id, 
			vision_shape.polygon.get(point_id % 3)
		)

func _process(delta: float) -> void:
	dir_change_timer += delta

func _physics_process(delta: float) -> void:
	if move_and_slide():
		turn_around()

func set_direction() -> bool:
	var new_direction : Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
		
	if abs(direction.y) < abs(direction.x):
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif abs(direction.x) < abs(direction.y):
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_direction == cardinal_direction:
		return false
	
	cardinal_direction = new_direction
	
	return true

func turn_around() -> void:
	direction = -position.direction_to(get_slide_collision(0).get_position())
	direction = direction.normalized()

func take_hit(hit_points : float, box : Area2D) -> void:
	health -= hit_points
	if health <= 0:
		die()
	enemy_state_machine.change_state(enemy_state_hurt)
	direction = -position.direction_to(box.global_position).normalized()

func die() -> void:
	queue_free()
	
func update_anim(state) -> void:
	animation_player.play(state + "_" + get_direction())

func get_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		cardinal_direction_name = "down"
	elif cardinal_direction == Vector2.UP:
		cardinal_direction_name = "up"
	elif cardinal_direction == Vector2.LEFT:
		cardinal_direction_name = "left"
	elif cardinal_direction == Vector2.RIGHT:
		cardinal_direction_name = "right"
	return cardinal_direction_name


func _on_vision_body_entered(body: Node2D) -> void:
	if body.is_class("CharacterBody2D"):
		bodies_in_vision.append(body)


func _on_vision_body_exited(body: Node2D) -> void:
	if body.is_class("CharacterBody2D"):
		var position : int = bodies_in_vision.find(body)
		bodies_in_vision.remove_at(position)
