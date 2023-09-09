extends Node2D

@onready var door_spr = $DoorSprite
@onready var static_colision = $StaticBody2D/CollisionShape2D
@onready var animation = $GateAnimation


func _on_button_area_entered(area: Area2D) -> void:
	animation.play("open")
	static_colision.set_deferred("disabled",true)
	door_spr.z_index = 0


func _on_button_area_exited(area: Area2D) -> void:
	animation.play_backwards("open")
	static_colision.set_deferred("disabled",false)
	door_spr.z_index = -1
