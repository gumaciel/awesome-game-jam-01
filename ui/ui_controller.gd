extends CanvasLayer

var current_player : String = "Player1"
var before_player : String = "Player2"
var temp_player : String 

@onready var alternate_ui = $ChangeChar/AlternateButton1

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_switch_char()
	pass

func _switch_char():
	get_parent().get_node(current_player).set_physics_process(false)
	temp_player = current_player
	current_player = before_player
	before_player = temp_player
	get_parent().get_node(current_player).set_physics_process(true)
	if alternate_ui.z_index == 1:
		alternate_ui.z_index = 0
		return
	alternate_ui.z_index = 1

	pass
