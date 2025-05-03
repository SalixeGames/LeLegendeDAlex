class_name StateAttack extends State


@export_category("Sounds")
@export var attack_sound : AudioStreamWAV
@export var grunt_sound : AudioStreamWAV

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var idle: State = $"../StateIdle"
@onready var walk: StateWalk = $"../StateWalk"
@onready var hit_box: CollisionShape2D = $"../../Sprite2D/sword/AttackCollision"
@onready var audio_player: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

var attacking : bool


func enter() -> void:
	controller.update_anim(get_attack_type())
	animation_player.animation_finished.connect(end_attack)
	attacking = true
	hit_box.disabled = false
	
	audio_player.stream = grunt_sound if not randi() % 5 else attack_sound
	audio_player.play()
	
	if controller.sword >= GameState.SwordState.expert:
		controller.set_hovering_state(true)

func get_attack_type() -> String:
	if controller.sword >= GameState.SwordState.strong:
		return "spin"
	return "attack"
	
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	hit_box.disabled = true
	
	if controller.sword >= GameState.SwordState.expert:
		controller.set_hovering_state(false)
	
func process(_delta : float) -> State:
	controller.velocity = controller.direction * walk.move_speed * get_dash_speed()
	
	if controller.set_direction():
		controller.update_anim("walk")
		return walk
	
	if not attacking:
		controller.velocity = Vector2.ZERO
		get_tree().create_timer(10)
		return idle
		
	return self

func get_dash_speed() -> int:
	if controller.sword >= GameState.SwordState.medium:
		return 4
	return 1
	
func physics(_delta : float) -> State:
	return null

func handle_input(_event: InputEvent) -> State:
	return null

func end_attack(_newAnimName : String) -> void:
	attacking = false
