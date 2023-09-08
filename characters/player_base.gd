class_name PlayerBase
extends "res://characters/templates/player_template_1.gd"


var direction : Vector2
@export var speed_time : float
@onready var base_raycasts : Node2D = $Raycasts
@export var animations : AnimationPlayer
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


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("_on_area_2d_body_entered")

