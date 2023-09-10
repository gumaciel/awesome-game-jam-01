extends Control

@export var player_1 : PlayerBase 
@export var player_2 : PlayerBase

@onready var ui_player_1 := %Player1
@onready var ui_player_2 := %Player2

var z_index_active := -1
var z_index_inactive := -2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if not _is_mobile():
		$MobileButtons.hide()
	
	if not (player_1 && player_2):
		push_error("Player must be setted")
		return
	
	_change_overlay()
	
func _is_mobile() -> bool:
	return OS.get_name() == "Android" or OS.get_name() == "iOS"

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("alternate"):
		_switch_char()
	if event.is_action_pressed("configuration"):
		_pause()

func _switch_char() -> void:
	player_1.active = not player_1.active
	player_2.active = not player_2.active

	_change_overlay()

func _change_overlay() -> void:
	ui_player_1.z_index = z_index_active if player_1.active else z_index_inactive
	ui_player_2.z_index = z_index_active if player_2.active else z_index_inactive

func _pause() -> void:
	get_tree().paused = !get_tree().paused

	var input_mode := Input.MOUSE_MODE_VISIBLE if get_tree().paused else Input.MOUSE_MODE_HIDDEN
	Input.set_mouse_mode(input_mode)
