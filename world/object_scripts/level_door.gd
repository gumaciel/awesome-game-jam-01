extends Area2D

@export var next_level : PackedScene
var first_player : Node2D
var unlocked = false

func _ready() -> void:
	SceneTransition.scene_to_change = next_level

func _on_chest_area_entered(area: Area2D) -> void:
	if unlocked:
		return
	unlocked = true
	$Sprite2D.frame = 0
	$DoorOpen.play()


func _on_area_entered(area: Area2D) -> void:
#	if !unlocked:
#		return
	if first_player == null:
		first_player = area.get_parent()
	if first_player == area.get_parent():
		return
	SceneTransition.change_scene_to_packed(next_level)
