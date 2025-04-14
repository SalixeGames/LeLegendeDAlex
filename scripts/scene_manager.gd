class_name SceneManager extends Node2D

@export var player : Player
var teleporters : Array[SceneSwitcher]

func _ready() -> void:
	_load_scene(GameState.region_coming_from)

func _load_scene(from : GameState.Region) -> void:
	# Yuck! I need to make a better system. (':& ¦:')
	# For now it is what it is, I don't want to do this manually lol
	# - Salixe
	for child in get_children():
		if child is SceneSwitcher:
			child.deactivate()
			teleporters.append(child)
			if child.destination == from:
				player.respawn_position = child.position
				child.players_inside.append(player)
				player.home_base = child
	player.respawn()
	for teleporter : SceneSwitcher in teleporters:
		teleporter.activate()
