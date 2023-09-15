extends Control

@export var music_number : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneTransition.play_music(music_number)
	pass # Replace with function body.

