class_name MobSpawner extends Node2D

@export var mobs_to_spawn : PackedScene = null
@export var number_min : int = 0
@export var number_max : int = 0
@export var time_between_spawn : float = 0.0
@export var roaming_radius : float = 150.0

var child_count : int = 0
var spawning : bool = false
var spawning_timer : float = 0.0

@onready var visualizer: MeshInstance2D = $MeshInstance2D

func _ready() -> void:
	visualizer.mesh.set("radius", roaming_radius)
	visualizer.mesh.set("height", 2*roaming_radius)
	spawning_timer = time_between_spawn  # So it begin to spawn instantly
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
		mob.roaming_radius = roaming_radius
		
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
	
	return adjust_position(random_position)

func adjust_position(random_position : Vector2) -> Vector2:
	# https://docs.godotengine.org/en/stable/tutorials/physics/ray-casting.html
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(
		position, position + random_position
	)
	var result = space_state.intersect_ray(query)
	
	if result:
		random_position = result.position - position
		
	return random_position

func on_child_death() -> void:
	child_count -= 1
	if child_count < number_min:
		start_spawn_mobs()
