extends ColorRect

func _ready():
	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	size = DisplayServer.screen_get_size()

func _on_viewport_size_changed():
	set_anchors_and_offsets_preset(Control.PRESET_CENTER, Control.PRESET_MODE_KEEP_SIZE)
	size = DisplayServer.screen_get_size()
