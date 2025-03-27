class_name BaseEnemy extends CharacterBody2D

@export_category("Stats")
@export var health : float = 5.0

func take_hit(hit_points : float) -> void:
	health -= hit_points
	if health <= 0:
		die()

func die() -> void:
	queue_free()
