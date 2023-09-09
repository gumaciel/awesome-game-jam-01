extends Node


var current_player_position : Vector2
var is_heavy : bool

func _player_properties(player_pos : Vector2 , heavy : bool):
	current_player_position = player_pos
	is_heavy = heavy
	
