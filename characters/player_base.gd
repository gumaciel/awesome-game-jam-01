class_name PlayerBase
extends "res://characters/templates/player_template_1.gd"


var direction : Vector2
@export var speed_time : float
@onready var base_raycasts : Node2D = $Raycasts
@export var animations : AnimationPlayer
@export var heavy : bool
@export var active := true :
	set(value):
		set_physics_process(value)
		set_process(value)
		set_process_unhandled_input(value)
		active = value

func _ready():
	self.active = active
	move_time = speed_time
	raycasts = base_raycasts
	animation_player = animations
	is_heavy = heavy


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("game over")
	if body as TileMap:
		SceneTransition._death_event()
		return
	if body.get_parent().name == "Arrow":
		if heavy:
			body.get_parent().queue_free()
			return
	SceneTransition._death_event()
	



