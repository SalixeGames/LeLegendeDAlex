class_name State extends Node

static var controller : CharacterBody2D

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func process(_delta : float) -> State:
	return null
	
func physics(_delta : float) -> State:
	return null

func handle_input(_event: InputEvent) -> State:
	return null
