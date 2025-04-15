class_name SceneSwitcher extends Node2D

@export var destination : GameState.Region
@export var players_inside : Array[Player] = []

@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

var can_detect : bool = true

func _ready() -> void:
	if players_inside:
		deactivate()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		players_inside.append(body)
	if can_detect:
		GameState.switch_region(destination)

func deactivate() -> void:
	collision_shape_2d.disabled = true
	can_detect = false
	
func activate() -> void:
	collision_shape_2d.disabled = false
	if not players_inside:
		can_detect = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body in players_inside:
		can_detect = true
		players_inside.erase(body)
