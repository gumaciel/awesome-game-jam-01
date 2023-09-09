extends TileMap


var spikes_holes = Vector2i(3,1)
var spikes = Vector2i(2,1)
var bridges = [Vector2i(2,3),Vector2i(3,3),Vector2i(4,3),Vector2i(5,3)]
var hole = Vector2i(6,0)

func _physics_process(delta: float) -> void:
	pass
#	var tile_pos = self.local_to_map(PlayerManagger.current_player_position)
#	var current_tile = self.get_cell_atlas_coords(0,tile_pos)
#	if current_tile == spikes_holes:
#		_spikes(tile_pos)
#		return
#	if bridges.has(current_tile):
#		_bridge(tile_pos)
#		return
#	if current_tile == spikes:
#		print("game over")




func _spikes(tile_pos) -> void:
	var timer = get_tree().create_timer(0.5)
	await timer.timeout
	self.set_cell(0,tile_pos,2,spikes)

func _bridge(tile_pos,is_heavy) -> void:
	if is_heavy:
		self.set_cell(0,tile_pos,2,hole)

func _verify_tile(pos,heavy):
	var tile_pos = self.local_to_map(pos)
	var current_tile = self.get_cell_atlas_coords(0,tile_pos)
	if current_tile == spikes_holes:
		_spikes(tile_pos)
		return
	if bridges.has(current_tile):
		_bridge(tile_pos,heavy)
		return
	if current_tile == spikes:
		print("game over")
	

func _on_player_1_call_scenario(current_pos, is_heavy) -> void:
	_verify_tile(current_pos,is_heavy)
	pass # Replace with function body.


func _on_player_2_call_scenario(current_pos, is_heavy) -> void:
	_verify_tile(current_pos,is_heavy)
	pass # Replace with function body.


