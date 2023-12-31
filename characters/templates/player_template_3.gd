extends Node2D

var is_walking = false
var raycasts : Node2D
var animation_player : AnimationPlayer
var inputs = {  "ui_up"    : Vector2.UP,
				"ui_down"  : Vector2.DOWN,
				"ui_left"  : Vector2.LEFT,
				"ui_right" : Vector2.RIGHT
			}


func _unhandled_input(event) -> void:

	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			animation_player.play(dir)
			move(dir)
			


func move(dir) -> void:
	var colliders : Array = []
	for ray in raycasts.get_children():
		if ray.is_colliding():
			colliders.append(ray.target_position.clamp(Vector2(-1,-1),Vector2(1,1)))
	if colliders.has(inputs[dir]):
		is_walking = false
		return
	var move_tween = create_tween()
	var tile_position = position + inputs[dir] * 16
	move_tween.tween_property(self, "position",tile_position , 0.2 )
	await move_tween.finished
	animation_player.pause()


