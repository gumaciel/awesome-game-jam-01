class_name PlayerBase
extends "res://characters/templates/player_template_1.gd"


var direction : Vector2
@export var speed_time : float
@onready var base_raycasts : Node2D = $Raycasts
@export var animations : AnimationPlayer
@export var heavy : bool
@export var active := true :
	set(value):
		set_physics_process(value)
		set_process(value)
		set_process_unhandled_input(value)
		active = value

func _ready():
	self.active = active
	GlobalSignals.game_over.connect(_death)
	move_time = speed_time
	raycasts = base_raycasts
	animation_player = animations
	is_heavy = heavy


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as TileMap:
		GlobalSignals.game_over.emit()
		return
	if body.is_in_group("Arrows"):
		if heavy:
			var shield_direction = clamp((body.global_position - self.position),
									Vector2(-1,-1),Vector2(1,1))
			if shield_direction == Vector2(-1,-1):
				animation_player.play("left")
			elif shield_direction == Vector2(1,1):
				animation_player.play("right")
			animation_player.stop()
			body.get_parent().queue_free()
			$ShieldSound.play()
			return
	GlobalSignals.game_over.emit()

func _death() -> void:
	active = false
	$DeathSound.play()
	$Animations.play("death")
	await $Animations.animation_finished
	SceneTransition._death_event()

