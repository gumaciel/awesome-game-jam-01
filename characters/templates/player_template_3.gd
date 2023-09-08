extends Node2D

var raycasts : Node2D
var inputs = {  "ui_up"    : Vector2.UP,
				"ui_down"  : Vector2.DOWN,
				"ui_left"  : Vector2.LEFT,
				"ui_right" : Vector2.RIGHT
			}

func _unhandled_input(event) -> void:
	var colliders : Array = []
	for ray in raycasts.get_children():
		if ray.is_colliding():
			colliders.append(ray.target_position.clamp(Vector2(-1,-1),Vector2(1,1)))

	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			if colliders.has(inputs[dir]):
				break
			move(dir)


func move(dir) -> void:
	var move_tween = create_tween()
	var tile_position = position + inputs[dir] * 16
	move_tween.tween_property(self, "position",tile_position , 0.5 )


