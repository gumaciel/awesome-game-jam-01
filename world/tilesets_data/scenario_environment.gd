extends TileMap


var spikes_holes = Vector2i(3,1)
var spikes = Vector2i(2,1)
var bridges = [Vector2i(2,3),Vector2i(3,3),Vector2i(4,3),Vector2i(5,3)]
var hole = Vector2i(6,0)
func _physics_process(delta: float) -> void:
	var tile_pos = self.local_to_map(PlayerManagger.current_player_position)
	var current_tile = self.get_cell_atlas_coords(0,tile_pos)
	if current_tile == spikes_holes:
		_spikes(tile_pos)
		return
	if bridges.has(current_tile):
		_bridge(tile_pos)



func _spikes(tile_pos) -> void:
	var timer = get_tree().create_timer(0.5)
	await timer.timeout
	self.set_cell(0,tile_pos,2,spikes)

func _bridge(tile_pos) -> void:
	if PlayerManagger.is_heavy:
		self.set_cell(0,tile_pos,2,hole)
