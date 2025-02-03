extends Label

@onready var current_time:Timer = $"../LungTimer"
@onready var alarm_player:AudioStreamPlayer = $AudioStreamPlayer
@export var shader:ColorRect


#func alter_vignette():
# 	var tween: Tween = create_tween()
#	tween.tween_property(shader.material, "shader_parameter/intensity", 0.2, 0.25).set_trans(Tween.TRANS_SINE)
#	tween.tween_property(shader.material, "shader_parameter/intensity", 0, 0.25).set_trans(Tween.TRANS_SINE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var timer:int = int(current_time.time_left / 2.0)-1
	if timer <=5 and timer >=0:
		if not alarm_player.playing:
			alarm_player.playing = true
			#alter_vignette()
		alarm_player.pitch_scale = 1 - (timer-2) * 0.1
		text = str(timer)
	else:
		alarm_player.playing = false
		text = ""
		
