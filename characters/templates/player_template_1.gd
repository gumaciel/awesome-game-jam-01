extends CharacterBody2D

@export var ID_Player: int 
@export var Moving_Mode: int

const GRID_SIZE: float = 16.0

var is_moving: bool = false

func _physics_process(_delta: float) -> void:
	if get_direction() != Vector2.ZERO and not is_moving:
		is_moving = true
		var direction: Vector2 = get_direction()
		var move_tween = create_tween()
		move_tween.tween_property(
			self, 
			"position", 
			position + direction * GRID_SIZE, 
			0.5
		)
		await get_tree().create_timer(.5).timeout
		is_moving = false

func get_direction() -> Vector2:
	return Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up","ui_down")
		)

