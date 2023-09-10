extends Node2D

@onready var door_spr = $DoorSprite
@onready var static_colision = $StaticBody2D/CollisionShape2D
@onready var animation = $GateAnimation
var current_player : Node2D

func _on_button_area_entered(area: Area2D) -> void:
	if current_player == null:
		current_player = area.get_parent()
	if area.get_parent() != current_player:
		return
	animation.play("open")
	static_colision.set_deferred("disabled",true)



func _on_button_area_exited(area: Area2D) -> void:
	if area.get_parent() != current_player:
		return
	print("saiu")
	animation.play_backwards("open")
	current_player = null
	static_colision.set_deferred("disabled",false)

