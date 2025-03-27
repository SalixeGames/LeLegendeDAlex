class_name BaseEnemy extends CharacterBody2D

@export_category("Positioning")
@export var spawn_position : Vector2 = Vector2(0, 0)
@export var roaming_radius : float = 150

@export_category("Stats")
@export var health : float = 5.0

var direction : Vector2 = Vector2.ZERO
var dir_change_timer : float = 6

@onready var state_machine: StateMachine = $StateMachine

func _init() -> void:
	#state_machine.initialize(self)
	pass

func _process(delta: float) -> void:
	dir_change_timer += delta
	set_direction()

func _physics_process(delta: float) -> void:
	move_and_slide()

func set_direction() -> void:
	if (position - spawn_position).length() > roaming_radius:
		direction = position.direction_to(spawn_position)
	elif dir_change_timer >= 5:
		direction = Vector2((randf()*2)-1,(randf()*2)-1)
		dir_change_timer = 0.0
	velocity = direction.normalized() * 50

func take_hit(hit_points : float) -> void:
	health -= hit_points
	if health <= 0:
		die()

func die() -> void:
	queue_free()
