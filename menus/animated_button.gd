extends TextureButton

func _ready() -> void:
	# Para capturar el mando
	grab_focus()
	visibility_changed.connect(grab_focus)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_hovered():
		scale = lerp(scale, Vector2.ONE * 0.9, 0.2)
		modulate = lerp(modulate, Color.GRAY, 0.2)
	else:
		scale = lerp(scale, Vector2.ONE, 0.2)
		modulate = lerp(modulate, Color.WHITE, 0.2)
	
