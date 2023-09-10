extends Area2D

func _on_area_entered(_area: Area2D) -> void:
	$ButtonSprite.frame = 1

func _on_area_exited(_area: Area2D) -> void:
	$ButtonSprite.frame = 0
