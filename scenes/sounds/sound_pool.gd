@tool
class_name SoundPool
extends Node2D

func _get_audio_players() -> Array[AudioStreamPlayer2D]:
	var audio_players : Array[AudioStreamPlayer2D] = []
	for child in get_children():
		if child is AudioStreamPlayer2D:
			audio_players.append(child)
	return audio_players
	
func play_random_audio() -> void:
	var audio_players := _get_audio_players()
	
	if audio_players.size() > 0:
		var random_index = randi() % audio_players.size()
		var random_audio_player = audio_players[random_index]
		random_audio_player.play()

func _get_configuration_warnings() -> PackedStringArray:
	var has_audio := false
	for child in get_children():
		if child is AudioStreamPlayer2D:
			has_audio = true
			break
	
	if not has_audio:
		return ["Add at least one AudioStreamPlayer2D"]
		
	return []
