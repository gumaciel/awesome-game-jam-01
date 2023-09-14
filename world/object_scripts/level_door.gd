extends Area2D

@export var next_level : String
var first_player : Node2D

func _on_chest_area_entered(area: Area2D) -> void:
	$Sprite2D.frame = 0


func _on_area_entered(area: Area2D) -> void:
	first_player = area.get_parent()
	if first_player == area.get_parent():
		return
	get_tree().change_scene_to_file(next_level)
	pass # Replace with function body.
