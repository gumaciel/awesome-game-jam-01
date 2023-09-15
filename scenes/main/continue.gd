extends Button

@export var scene_to_transition : PackedScene

func _on_pressed():
	disabled = true
	$AudioStreamPlayer.play() 

func change_scene() -> void:
	SceneTransition.change_scene_to_packed(scene_to_transition)
