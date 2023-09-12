extends TileMap


var spikes_holes = Vector2i(3,1)
var spikes = Vector2i(2,1)
var bridges = [Vector2i(2,3),Vector2i(3,3),Vector2i(4,3),Vector2i(5,3)]
var hole = Vector2i(6,0)
var crack_tile = Vector2i(6,3)


func _tiles_event(pos,heavy):
	var tile_pos = self.local_to_map(pos)
	var current_tile = _verify_tile(0,tile_pos)
	if current_tile == spikes_holes:
		_spikes(tile_pos)
		return
	if bridges.has(current_tile):
		_bridge(tile_pos,heavy)
		return


func _spikes(tile_pos) -> void:
	var timer = get_tree().create_timer(0.3)
	await timer.timeout
	self.set_cell(0,tile_pos,2,spikes)

func _bridge(tile_pos,is_heavy) -> void:
	if is_heavy:
		self.set_cell(0,tile_pos,2,hole)
		SceneTransition._death_event()
		return
	if _verify_tile(1,tile_pos) == crack_tile:
		self.set_cell(0,tile_pos,2,hole)
		return
	if _verify_tile(1,tile_pos) == Vector2i(-1,-1):
		self.set_cell(1,tile_pos,2,crack_tile)
		return

		


func _verify_tile(layer, pos):
	return self.get_cell_atlas_coords(layer,pos)


func _on_player_1_call_scenario(current_pos, is_heavy) -> void:
	_tiles_event(current_pos,is_heavy)
	pass # Replace with function body.


func _on_player_2_call_scenario(current_pos, is_heavy) -> void:
	_tiles_event(current_pos,is_heavy)
	pass # Replace with function body.


