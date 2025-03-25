class_name Player extends CharacterBody2D


var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
var cardinal_direction_name : String = "right"
var sword = -1

@export_category("Sword")
@export var sword_colors: Array[Color] = [Color.RED, Color.GREEN, Color.BLUE, Color.GOLD]
@onready var sword_sprite: MeshInstance2D = $Sprite2D/sword/AttackCollision/MeshInstance2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine


func _ready() -> void:
	player_state_machine.initialize(self)
	

func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_raw_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()
	update_sword()
	
	if Input.is_action_just_pressed("sword+"):
		if sword < GameState.SwordState.expert:
			GameState.update_sword_state(sword + 1)
	
	if Input.is_action_just_pressed("sword-"):
		if sword > GameState.SwordState.noob:
			GameState.update_sword_state(sword - 1)
		

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

func update_sword() -> void:
	if sword != GameState.sword_state:
		sword = GameState.sword_state
		sword_sprite.modulate = sword_colors[sword]
		
