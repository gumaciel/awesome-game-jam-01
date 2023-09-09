extends ColorRect

func _ready() -> void:
	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	_update_size()
	
func _on_viewport_size_changed() -> void:
	_update_size()

func _update_size() -> void:
	size = DisplayServer.screen_get_size()
	set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_KEEP_SIZE)
