class_name StateAttack extends State


@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var idle: State = $"../StateIdle"
@onready var walk: StateWalk = $"../StateWalk"
@onready var hit_box: CollisionShape2D = $"../../AttackCollision"

var attacking : bool


func enter() -> void:
	player.update_anim("attack")
	animation_player.animation_finished.connect(end_attack)
	attacking = true
	hit_box.disabled = false
	
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	hit_box.disabled = true
	
func process(_delta : float) -> State:
	player.velocity = player.direction * walk.move_speed * 2
	
	if player.set_direction():
		player.update_anim("walk")
		return walk
	
	if not attacking:
		player.velocity = Vector2.ZERO
		get_tree().create_timer(10)
		return idle
		
	return self
	
func physics(_delta : float) -> State:
	return null

func handle_input(_event: InputEvent) -> State:
	return null

func end_attack(_newAnimName : String) -> void:
	attacking = false
