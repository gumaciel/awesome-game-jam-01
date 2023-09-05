extends CharacterBody2D
class_name  PlayerBase

var direction : Vector2
var SPEED : float = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("ui_left","ui_right")
	direction.y = Input.get_axis("ui_up","ui_down")
	_movement(SPEED)
	pass
	

func _movement(speed):
	velocity = direction * speed
	move_and_slide()
