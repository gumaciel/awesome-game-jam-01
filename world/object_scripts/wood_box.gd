extends Area2D

@onready var ray_casts := %Raycasts

var current_position : Vector2

@onready var directions := {
	$Raycasts/Up.name : Vector2.UP,
	$Raycasts/Down.name : Vector2.DOWN,
	$Raycasts/Left.name : Vector2.LEFT,
	$Raycasts/Right.name : Vector2.RIGHT,
}

#var array_colliders : Array[Ray]

func _ready() -> void:
	current_position = self.position

func _on_area_entered(area: Area2D) -> void:
	var player_current_direction := PlayerManager.current_direction
	var colliding := false
	if area.get_parent().name != "Player1":
		return
	for ray in ray_casts.get_children():
		if ray.is_colliding():
			var collider_name := ray.name
			if directions.get(collider_name) == player_current_direction:
				colliding = true
	
	if colliding:
		return
	
	current_position = self.position
	$PushSound.play()
	var move_box = create_tween()
	move_box.tween_property(
		self,
		"position",
		self.position + 16 * player_current_direction,
		0.025
	)
#	for i in array_colliders:
#		i.get_node("Area2D/CollisionShape2D").set_deferred("disabled", true)
#		array_colliders.erase(i)
#
#	await move_box.finished
#
#	for ray in ray_casts.get_children():
#		if ray.is_colliding():
#			var local_ray : Ray = ray
#			array_colliders.append(local_ray.opposite)
#			print(local_ray.opposite.name)
#			local_ray.opposite.get_node("Area2D/CollisionShape2D").set_deferred("disabled", false)


func _on_body_entered(body: Node2D) -> void:
#	if body as TileMap:
#		self.position = current_position
	pass
