class_name EnemyState extends Node

@onready var controller: BaseEnemy = $"../.."

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func process(_delta : float) -> EnemyState:
	return null
	
func physics(_delta : float) -> EnemyState:
	return null
