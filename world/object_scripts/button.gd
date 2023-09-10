extends Area2D



func _on_area_entered(area: Area2D) -> void:
	$ButtonSprite.frame = 1

	



func _on_area_exited(area: Area2D) -> void:
	$ButtonSprite.frame = 0

	
