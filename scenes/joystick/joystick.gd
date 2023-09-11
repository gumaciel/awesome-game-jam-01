extends Control

var is_touching : bool = false

@onready var arrow_textures := {
	"BASE" : preload("res://assets/hud/joystick/arrows_base.png"),
	"UP" : preload("res://assets/hud/joystick/arrows_up.png"),
	"DOWN" : preload("res://assets/hud/joystick/arrows_down.png"),
	"LEFT" : preload("res://assets/hud/joystick/arrows_left.png"),
	"RIGHT" : preload("res://assets/hud/joystick/arrows_right.png")
}

@onready var texture : TextureRect = $Texture
var action_pressing : String

func _process(_delta):
	if is_touching:
		var delta_pos = get_local_mouse_position()
		var actual_action_pressing : String
		
		if delta_pos.y < -10:
			actual_action_pressing = "move_up"
			texture.texture = arrow_textures.UP
		elif delta_pos.y > 10:
			actual_action_pressing = "move_down"
			texture.texture = arrow_textures.DOWN
		elif delta_pos.x < -10:
			actual_action_pressing = "move_left"
			texture.texture = arrow_textures.LEFT
		elif delta_pos.x > 10:
			actual_action_pressing = "move_right"
			texture.texture = arrow_textures.RIGHT
		else:
			return
		if actual_action_pressing != action_pressing:
			Input.action_release(action_pressing)
	
		action_pressing = actual_action_pressing
		Input.action_press(action_pressing)

func _on_texture_rect_gui_input(event):
	if event is InputEventScreenTouch:
		var touch = event as InputEventScreenTouch
		
		is_touching = touch.pressed
		if not is_touching:
			texture.texture = arrow_textures.BASE
			Input.action_release(action_pressing)
