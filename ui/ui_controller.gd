extends Control

@export var player_1 : PlayerBase 
@export var player_2 : PlayerBase

@onready var alternate_ui = $ChangeChar/AlternateButton1

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_switch_char()

func _switch_char():
	player_1.active = not player_1.active
	player_2.active = not player_2.active

	if alternate_ui.z_index == 1:
		alternate_ui.z_index = 0
		return
	alternate_ui.z_index = 1
