class_name HitBox extends Area2D

signal damaged(damage : float)


func take_damage(damage : float, box : Area2D) -> void:
	damaged.emit(damage, box)
