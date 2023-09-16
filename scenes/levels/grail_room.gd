extends Control

var player_active : PlayerBase
@onready var player_1 := %Player1
@onready var player_2 := %Player2
var finishable := true

func _on_areas_complete() -> void:
	if finishable:
		$AnimationPlayer.play("win")
		if %Player1.active:
			player_active = %Player1
		else:
			player_active = %Player2
		player_active.active = false
		flip()

func flip() -> void:
	%Player1/WinningSprite2D.flip_h = false
	%Player2/WinningSprite2D.flip_h = true

func finish() -> void:
	finishable = false
	player_1.get_node("Texture").visible = true
	player_2.get_node("Texture").visible = true
	player_1.get_node("WinningSprite2D").visible = false
	player_2.get_node("WinningSprite2D").visible = false
	player_active.active = true
