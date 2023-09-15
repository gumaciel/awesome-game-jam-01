extends Control

@export var scrool_speed := 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta):
	$Objects/ParallaxBackground.scroll_offset.x += delta * scrool_speed


func _on_continue_pressed() -> void:
	var animation : Animation = $AnimationPlayer.get_animation("continue")
	var track = animation.find_track("Objects/Grail:position", Animation.TYPE_VALUE)
	animation.track_set_key_value(track, 0, $Objects/Grail.position)

	_disable_buttons()
	%Credits/AudioStreamPlayer.play() 
	$AnimationPlayer.play("continue")
	
func _disable_buttons() -> void:
	%Continue.disabled = true
	%Credits.disabled = true
