extends TextureRect
var speed := 1

var forward := false

func _process(delta):
	if modulate.a <= 0.2:
		forward = true
	elif modulate.a >= 1:
		forward = false
		
	if forward:
		modulate.a += delta * speed
	else:
		modulate.a -= delta * speed
	
