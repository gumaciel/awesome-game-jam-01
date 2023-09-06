class_name PlayerBase
extends "res://characters/templates/player_template_3.gd"

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
