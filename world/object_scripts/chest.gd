extends Area2D

var opened = false

func _on_area_2d_entered(area: Area2D) -> void:
	if opened:
		return
	opened = true
	$TreasureKey.play()
	$Sprite2D.frame = 1

