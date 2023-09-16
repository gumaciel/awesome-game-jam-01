extends Node2D

signal complete

var on_area_count := 0 :
	set(value):
		on_area_count = value
		if on_area_count >= 2:
			emit_signal("complete")

func _on_winning_area_2d_area_entered(area):
	on_area_count += 1

func _on_winning_area_2d_area_exited(area):
	on_area_count -= 1

