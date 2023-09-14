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
	print(name)
	GlobalSignals.game_over.connect(_death)
	self.active = active
	move_time = speed_time
	raycasts = base_raycasts
	animation_player = animations
	is_heavy = heavy


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body as TileMap:
		GlobalSignals.game_over.emit()
		return
	if body.get_parent().name == "Arrow":
		if heavy:
			body.get_parent().queue_free()
			return
	GlobalSignals.game_over.emit()

func _death() -> void:
	active = false
	$Animations.play("death")
	await $Animations.animation_finished
	print("game over")
	SceneTransition._death_event()

