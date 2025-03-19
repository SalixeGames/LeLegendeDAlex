class_name HurtBox extends Area2D

@export var damage : float = 1.0


func _ready() -> void:
	area_entered.connect(box_entered)

func box_entered(box : Area2D) -> void:
	if box is HitBox:
		box.take_damage(damage)
