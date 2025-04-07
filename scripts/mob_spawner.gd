class_name MobSpawner extends Node2D

@export var mobs_to_spawn : PackedScene = null
@export var number_min : int = 0
@export var number_max : int = 0
@export var time_between_spawn : float = 0.0

var child_count : int = 0
var spawning : bool = false
var spawning_timer : float = 0.0

func _ready() -> void:
	spawning_timer = time_between_spawn  # So it begin to spawn instantlyS
	start_spawn_mobs()

func _process(_delta: float) -> void:
	if spawning:
		spawning_timer += _delta
		spawn_mob()

func start_spawn_mobs() -> void:
	spawning = true

func spawn_mob() -> void:
	if spawning_timer >= time_between_spawn:
		var mob : BaseEnemy = mobs_to_spawn.instantiate()
		mob.spawn_position = position
		
		mob.position = _get_spawning_position(mob.roaming_radius) 
		add_child(mob)
		child_count += 1
		spawning = child_count < number_max
			
		mob.connect("on_death", on_child_death)
		spawning_timer = 0

func _get_spawning_position(radius : float) -> Vector2:
	var random_angle : float = randf() * 2 * PI
	var random_position = Vector2.ZERO
	random_position.x = randf() * radius * cos(random_angle)
	random_position.y = randf() * radius * sin(random_angle)
	
	return random_position

func on_child_death() -> void:
	child_count -= 1
	if child_count < number_min:
		start_spawn_mobs()
