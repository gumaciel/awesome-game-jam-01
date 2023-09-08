extends TileMap

@export var player1 : Node2D
@export var player2 : Node2D

var spikes_holes = Vector2i(3,1)
var spikes = Vector2i(2,1)

func _physics_process(delta: float) -> void:
	var tile_pos = self.local_to_map(PlayerManagger.player_position)
	if self.get_cell_atlas_coords(0,tile_pos) == spikes_holes:
		var timer = get_tree().create_timer(0.5)
		await timer.timeout
		self.set_cell(0,tile_pos,2,spikes)
