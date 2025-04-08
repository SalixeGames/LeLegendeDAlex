class_name EnemyStateHurt extends EnemyState


@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var enemy_state_return_to_base: EnemyStateReturnToBase = $"../EnemyStateReturnToBase"

@export var acceleration : float = 5
var timer : float = 0
var hurt : bool = false

func enter() -> void:
	controller.update_anim("hurt")
	animation_player.animation_finished.connect(end_hurt)
	hurt = true
	timer = 0
	
func exit() -> void:
	animation_player.animation_finished.disconnect(end_hurt)
	hurt = false
	timer = 0
	
func process(_delta : float) -> EnemyState: 
	if not hurt:
		return enemy_state_return_to_base
	timer += _delta
	var speed_factor : float = controller.movement_speed * (2 / timer) * .25
	controller.velocity = controller.direction * speed_factor
	return self
	
func physics(_delta : float) -> EnemyState:
	return null

func end_hurt(_newAnimName : String) -> void:
	hurt = false
