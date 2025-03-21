class_name StateAttack extends State


@export_category("Sounds")
@export var attack_sound : AudioStreamWAV
@export var grunt_sound : AudioStreamWAV

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var idle: State = $"../StateIdle"
@onready var walk: StateWalk = $"../StateWalk"
@onready var hit_box: CollisionShape2D = $"../../AttackCollision"
@onready var audio_player: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

var attacking : bool


func enter() -> void:
	player.update_anim("attack")
	animation_player.animation_finished.connect(end_attack)
	attacking = true
	hit_box.disabled = false
	
	audio_player.stream = grunt_sound if not randi() % 5 else attack_sound
	audio_player.play()
	
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
