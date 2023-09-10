extends Node2D

@onready var arrow = preload("res://scenes/prefabs/arrow.tscn")
@onready var target_pos = $Target.position

func _on_timer_timeout() -> void:
	var arrow_instance = arrow.instantiate()
	self.add_child(arrow_instance)
	var arrom_move = create_tween()
	arrom_move.tween_property(arrow_instance,"position", target_pos,1)
	await arrom_move.finished
	if arrow_instance != null:
		arrow_instance.queue_free()
