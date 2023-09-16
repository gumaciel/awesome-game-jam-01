extends CanvasLayer

var scene_to_change : PackedScene
@export var music1 : AudioStreamWAV
@export var music2 : AudioStreamWAV

func change_scene_to_packed(packed_scene : PackedScene) -> void:
	if not packed_scene:
		printerr("Must send a packed_scene")
		return
	
	scene_to_change = packed_scene
	$AnimationPlayer.play("transition")

func _change_scene_on_tree() -> void:
	get_tree().change_scene_to_packed(scene_to_change)
	scene_to_change = null

func play_music(music):
	$LevelMusic.stop()
	if music == 1:
		$LevelMusic.stream = music1
	if music == 2:
		$LevelMusic.stream = music2
	$LevelMusic.play()

func _death_event():
	_reload()

func _reload():
	get_tree().reload_current_scene()

