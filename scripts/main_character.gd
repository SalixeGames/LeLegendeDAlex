class_name Player extends CharacterBody2D


var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
var cardinal_direction_name : String = "right"

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine


func _ready() -> void:
	player_state_machine.initialize(self)

func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_raw_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()

func  _physics_process(delta: float) -> void:
	move_and_slide()
	
func set_direction() -> bool:
	var new_direction : Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
		
	if !direction.y:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif !direction.x:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_direction == cardinal_direction:
		return false
	
	cardinal_direction = new_direction
	
	return true
	
func update_anim(state) -> void:
	animation_player.play(state + "_" + get_direction())

func get_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		cardinal_direction_name = "down"
	elif cardinal_direction == Vector2.UP:
		cardinal_direction_name = "up"
	elif cardinal_direction == Vector2.LEFT:
		cardinal_direction_name = "left"
	elif cardinal_direction == Vector2.RIGHT:
		cardinal_direction_name = "right"
	return cardinal_direction_name
