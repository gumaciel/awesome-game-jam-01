extends CharacterBody2D

var currentPos = [0,0]

func _input(event):
	if event.is_action_pressed("ui_right"):
		currentPos[0] += 16
	elif event.is_action_pressed("ui_left"):
		currentPos[0] -= 16
	elif event.is_action_pressed("ui_up"):
		currentPos[1] -= 16
	elif event.is_action_pressed("ui_down"):
		currentPos[1] += 16
	
	self.position = Vector2(currentPos[0], currentPos[1])
	
