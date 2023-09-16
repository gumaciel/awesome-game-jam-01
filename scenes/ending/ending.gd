extends Control

var main_scene := preload("res://scenes/main/main.tscn")

func _on_animation_player_animation_finished(anim_name : StringName):
	if anim_name == "load":
		SceneTransition.change_scene_to_packed(main_scene)
