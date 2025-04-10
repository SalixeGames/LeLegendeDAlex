class_name SceneManager extends Node2D

@export var player : Player
@export var teleporters : Dictionary[GameState.Region, SceneSwitcher]

func _ready() -> void:
	_load_scene(GameState.region_coming_from)

func _load_scene(from : GameState.Region) -> void:
	for teleporter : SceneSwitcher in teleporters.values():
		teleporter.deactivate()
	if from in teleporters.keys():
		player.respawn_position = teleporters[from].position
		teleporters[from].players_inside.append(player)
	player.respawn()
	for teleporter : SceneSwitcher in teleporters.values():
		teleporter.activate()
