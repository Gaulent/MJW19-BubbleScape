extends CanvasLayer

@onready var shader:ColorRect = $ColorRect

func alter_vignette():
	var tween: Tween = create_tween()
	tween.tween_property(shader.material, "shader_parameter/intensity", 0.2, 0.25).set_trans(Tween.TRANS_SINE)
	tween.tween_property(shader.material, "shader_parameter/intensity", 0, 0.25).set_trans(Tween.TRANS_SINE)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	SignalManager.lung_alter_vignette.connect(alter_vignette)
