class_name HouseManager extends SceneManager

@export var scene_switcher : SceneSwitcher

func _ready() -> void:
	scene_switcher.destination = GameState.region_coming_from
	
