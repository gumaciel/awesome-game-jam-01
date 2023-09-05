extends CharacterBody2D
class_name  PlayerBase

var direction : Vector2
var SPEED : float = 200


func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left","ui_right")
	direction.y = Input.get_axis("ui_up","ui_down")
	_movement(SPEED)
	pass

func _movement(speed):
	velocity = direction * speed
	move_and_slide()
