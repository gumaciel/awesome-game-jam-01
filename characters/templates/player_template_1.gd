extends Node2D

@export var ID_Player: int 
@export var Moving_Mode: int
@export var is_heavy : bool
var move_time = 0.1
var raycasts : Node2D
var animation_player : AnimationPlayer
signal call_scenario(current_pos : Vector2, is_heavy : bool)
const GRID_SIZE: float = 16.0
@export var walking_sound_pool : SoundPool

var is_moving: bool = false
var animation_direction = {
	Vector2.UP : "up",
	Vector2.DOWN : "down",
	Vector2.LEFT : "left",
	Vector2.RIGHT : "right",
	Vector2.ZERO : "stoped"
}
func _physics_process(_delta: float) -> void:
	if get_direction() != Vector2.ZERO and not is_moving:
		is_moving = true
		var colliders : Array = []
		var box = null
		for ray in raycasts.get_children():
			if ray.is_colliding():
				colliders.append(ray.target_position.clamp(Vector2(-1,-1),Vector2(1,1)))
		var direction: Vector2 = get_direction()
		PlayerManager.current_direction = direction
		if animation_direction.has(direction):
			animation_player.play(animation_direction[direction])
		if colliders.has(direction):
			animation_player.pause()
			is_moving = false
			return
		var move_tween = create_tween()
		move_tween.tween_property(
			self, 
			"position", 
			position + direction * GRID_SIZE, 
			move_time
		)
		await move_tween.finished
		emit_signal("call_scenario",self.position,is_heavy)
		is_moving = false
		animation_player.pause()
		return
	PlayerManager.current_direction = get_direction()

		if walking_sound_pool:
			walking_sound_pool.play_random_audio()
			

func get_direction() -> Vector2:
	var direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up","move_down")
		)
	if !animation_direction.has(direction):
		return Vector2.ZERO
	return direction

func _move_box():
	
	
	pass
