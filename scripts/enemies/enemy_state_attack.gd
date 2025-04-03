class_name EnemyStateAttack extends EnemyState


@export var move_speed : float = 50.0

@onready var enemy_state_return_to_base: EnemyStateReturnToBase = $"../EnemyStateReturnToBase"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var hurt_box: HurtBox = $"../../Body/HurtBox"
@onready var hurt_collider: CollisionShape2D = $"../../Body/HurtBox/CollisionShape2D"


var attacking : bool = false

func enter() -> void:
	controller.update_anim("attack")
	animation_player.animation_finished.connect(end_attack)
	attacking = true
	hurt_collider.disabled = false
	hurt_box.visible = true
	
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	hurt_collider.disabled = true
	hurt_box.visible = false
	
func process(_delta : float) -> EnemyState:
	if not attacking:
		return enemy_state_return_to_base
	
	controller.velocity = controller.direction * move_speed * 2
	
	return self
	
func physics(_delta : float) -> EnemyState:
	return null

func end_attack(_newAnimName : String) -> void:
	attacking = false
