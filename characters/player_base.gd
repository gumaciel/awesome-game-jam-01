class_name PlayerBase
extends CharacterBody2D

var direction : Vector2
var SPEED : float = 200

@export var active := true :
	set(value):
		set_physics_process(value)
		set_process(value)
		set_process_unhandled_input(value)
		active = value

func _ready():
	self.active = active

func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left","ui_right")
	direction.y = Input.get_axis("ui_up","ui_down")
	_movement(SPEED)

func _movement(speed):
	velocity = direction * speed
	move_and_slide()
