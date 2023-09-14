extends Node2D

@onready var fire_ball = preload("res://scenes/prefabs/fire_ball.tscn")
@export var bullet_speed : float = 20
var can_shot = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if !can_shot:
		return
	can_shot = false
	var player = area.get_parent()
	if area.name == "WoodBox":
		player = area
	player.set_physics_process(false)
	player.set_process(false)
	player.set_process_unhandled_input(false)
	_shoot(player)

func _shoot(target):
	var bullet = fire_ball.instantiate()
	self.get_parent().call_deferred("add_child",bullet)
	
	bullet.position = self.position
	var distance = self.position.distance_to(target.position)/16
	var bullet_time = (1 * distance) / bullet_speed 
	var timer = get_tree().create_timer(0.5)
	await timer.timeout
	$SoundPool.play_random_audio()
	var shot_move = create_tween()
	shot_move.tween_property(bullet,"position",target.position,bullet_time)
	can_shot = false
