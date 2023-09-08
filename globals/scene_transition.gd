extends CanvasLayer

var scene_to_change : PackedScene

func change_scene_to_packed(packed_scene : PackedScene) -> void:
	if not packed_scene:
		printerr("Must send a packed_scene")
		return
	
	scene_to_change = packed_scene
	$AnimationPlayer.play("transition")

func _change_scene_on_tree() -> void:
	get_tree().change_scene_to_packed(scene_to_change)
	scene_to_change = null
