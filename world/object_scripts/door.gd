extends Node2D

@onready var door_spr = $DoorSprite
@onready var static_colision = $StaticBody2D/CollisionShape2D


func _on_button_area_entered(area: Area2D) -> void:
	door_spr.frame = 0
	static_colision.set_deferred("disabled",true)
	door_spr.z_index = 0


func _on_button_area_exited(area: Area2D) -> void:
	door_spr.frame = 1
	static_colision.set_deferred("disabled",false)
	door_spr.z_index = -1
