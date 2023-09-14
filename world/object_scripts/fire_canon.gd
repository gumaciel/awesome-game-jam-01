extends Node2D

@onready var fire_ball = preload("res://scenes/prefabs/spider_bullet.tscn")
@export var bullet_speed : float = 20
var can_shot = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if !can_shot:
		return
	can_shot = false
	var is_player = true
	var player = area.get_parent()
	if area.collision_layer == 8:
		player = area
		is_player = false
	player.set_physics_process(false)
	player.set_process(false)
	player.set_process_unhandled_input(false)
	_shoot(player,is_player)

func _shoot(target, is_player):
	var bullet = fire_ball.instantiate()
	self.get_parent().call_deferred("add_child",bullet)
	bullet.position = self.global_position
	var distance = self.position.distance_to(target.position)/16
	var bullet_time = (1 * distance) / bullet_speed 
	var timer = get_tree().create_timer(0.5)
	await timer.timeout
	$SoundPool.play_random_audio()
	var shot_move = create_tween()
	shot_move.tween_property(bullet,"position",target.global_position,bullet_time)
	await shot_move.finished
	bullet.set_collision_layer_value(3,false)
	bullet.reparent(target)
