extends Control

func _on_animation_player_animation_finished(anim_name : StringName):
	if anim_name == "load":
		SceneTransition.change_scene_to_packed(null)
