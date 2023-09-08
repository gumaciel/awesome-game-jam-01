extends Node2D

@export var ID_Player: int 
@export var Moving_Mode: int
var raycasts : Node2D
var anim : AnimationPlayer

const GRID_SIZE: float = 16.0

var is_moving: bool = false
var animation_direction = {
	Vector2.UP : "up",
	Vector2.DOWN : "down",
	Vector2.LEFT : "left",
	Vector2.RIGHT : "right"
	
}
func _physics_process(_delta: float) -> void:
	if get_direction() != Vector2.ZERO and not is_moving:
		is_moving = true
		var colliders : Array = []
		for ray in raycasts.get_children():
			if ray.is_colliding():
				colliders.append(ray.target_position.clamp(Vector2(-1,-1),Vector2(1,1)))
		var direction: Vector2 = get_direction()
		if animation_direction.has(direction):
			anim.play(animation_direction[direction])
		if colliders.has(direction):
			is_moving = false
			return
		var move_tween = create_tween()
		move_tween.tween_property(
			self, 
			"position", 
			position + direction * GRID_SIZE, 
			0.1
		)
		await get_tree().create_timer(.5).timeout
		anim.stop()
		is_moving = false

func get_direction() -> Vector2:
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up","ui_down")
		)
	if !animation_direction.has(direction):
		return Vector2.ZERO
	return direction

