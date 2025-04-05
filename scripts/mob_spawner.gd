class_name MobSpawner extends Node2D

@export var mobs_to_spawn : Array[PackedScene] = []
@export var number_min : Array[int] = []
@export var number_max : Array[int] = []


func _ready() -> void:
	for mob_index : int in mobs_to_spawn.size():
		for mob_i : int in number_max[mob_index]:
			var mob : BaseEnemy = mobs_to_spawn[mob_index].instantiate()
			mob.spawn_position = position
			
			var spawn_angle : float = randf() * 2 * PI
			mob.position.x += randf() * mob.roaming_radius * cos(spawn_angle)
			mob.position.y += randf() * mob.roaming_radius * sin(spawn_angle)
			add_child(mob)
