extends Area2D

@onready var ray_casts := %Raycasts

var current_position : Vector2

func _ready() -> void:
	current_position = self.position

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name != "Player1":
		return

	for ray in ray_casts.get_children():
		if ray.is_colliding():
			print("colliding")
	
	current_position = self.position
	$PushSound.play()
	var move_box = create_tween()
	move_box.tween_property(self,"position",
		self.position + 16 * PlayerManager.current_direction,
		0.2
	)

func _on_body_entered(body: Node2D) -> void:
#	if body as TileMap:
#		self.position = current_position
	pass
