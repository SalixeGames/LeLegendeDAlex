class_name BaseEnemy extends CharacterBody2D

@export_category("Positioning")
@export var spawn_position : Vector2 = Vector2(0, 0)
@export var roaming_radius : float = 150

@export_category("Stats")
@export var health : float = 5.0

var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
var cardinal_direction_name : String = "down"
var dir_change_timer : float = 6

@onready var enemy_state_machine: EnemyStateMachine = $EnemyStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	enemy_state_machine.initialize(self)

func _process(delta: float) -> void:
	dir_change_timer += delta

func _physics_process(delta: float) -> void:
	move_and_slide()

func set_direction() -> bool:
	if (position - spawn_position).length() > roaming_radius:
		direction = position.direction_to(spawn_position)
	elif dir_change_timer >= 5 or velocity == Vector2.ZERO:
		direction = Vector2i.DOWN if randi() % 2 else Vector2i.RIGHT
		direction *= -1 if randi() % 2 else 1
		dir_change_timer = 0.0
	direction = direction.normalized()
	
	var new_direction : Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
		
	if !direction.y:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif !direction.x:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_direction == cardinal_direction:
		return false
	
	cardinal_direction = new_direction
	
	return true

func take_hit(hit_points : float) -> void:
	health -= hit_points
	if health <= 0:
		die()

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
