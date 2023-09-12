extends CharacterBody2D


@onready var raycast = $raycast

@export var collid: int

var grid_size := 16

var inputs := {
	"ui_up" : Vector2.UP,
	"ui_down" : Vector2.DOWN,
	"ui_left" : Vector2.LEFT,
	"ui_right" : Vector2.RIGHT
}

func move(dir):
	var _tween = create_tween()
	var vector_pos = inputs[dir] * grid_size
	raycast.target_position = vector_pos
	raycast.force_raycast_update()
	if raycast.is_colliding():
		_tween.tween_property(self, "position", position + vector_pos * grid_size, 0.2)
		return true
	return false
