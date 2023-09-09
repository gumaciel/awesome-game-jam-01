extends Node2D

@onready var fire_line = $RayFire

func _physics_process(delta: float) -> void:
	if fire_line.is_colliding():
		print("aaa")
	pass
