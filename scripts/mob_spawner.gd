class_name MobSpawner extends Node2D

@export var mobs_to_spawn : Array[PackedScene] = []
@export var number_min : Array[int] = []
@export var number_max : Array[int] = []


func _ready() -> void:
	for mob_index : int in mobs_to_spawn.size():
		for mob_i : int in number_max[mob_index]:
			var mob : BaseEnemy = mobs_to_spawn[mob_index].instantiate()
			mob.spawn_position = position
			mob.position.x += 2 * (randf() - 0.5) * mob.roaming_radius
			mob.position.y += 2 * (randf() - 0.5) * mob.roaming_radius
			add_child(mob)
