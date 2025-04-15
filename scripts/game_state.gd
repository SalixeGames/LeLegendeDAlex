extends Node2D

#autoload

enum SwordState {
	noob, medium, strong, expert
}

enum Region {
	town1, town2, town3, town4, 
	overworld, 
	donjon1, donjon2, donjon3, donjon4,
	house
}

# Need to declare each region here so the PackedScenes are preloaded
var regions_scenes : Dictionary[Region, PackedScene] = {
	Region.town1 : preload("res://scenes/regions/town_1.tscn"),
	Region.town2 : preload("res://scenes/regions/town_2.tscn"),
	Region.town3 : preload("res://scenes/regions/town_3.tscn"),
	Region.town4 : preload("res://scenes/regions/town_4.tscn"),
	Region.overworld : preload("res://scenes/regions/overworld.tscn"),
	Region.donjon1 : preload("res://scenes/regions/donjon1.tscn"),
	Region.donjon2 : preload("res://scenes/regions/donjon2.tscn"),
	Region.donjon3 : preload("res://scenes/regions/donjon3.tscn"),
	Region.donjon4 : preload("res://scenes/regions/donjon4.tscn"),
	Region.house : preload("res://scenes/regions/base_house.tscn")
}

var sword_state : SwordState = SwordState.noob
var active_region : Region = Region.overworld
var region_coming_from : Region = Region.overworld

func get_sword_state() -> SwordState:
	return sword_state

func update_sword_state(state : SwordState) -> void:
	sword_state = state

func switch_region(to : Region) -> void:
	get_tree().change_scene_to_packed(regions_scenes[to])
	region_coming_from = active_region
	active_region = to
