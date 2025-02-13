extends Label

@onready var current_time:Timer = $"../LungTimer"
@onready var alarm_player:AudioStreamPlayer = $AudioStreamPlayer


func _process(_delta: float) -> void:
	var timer:int = int(current_time.time_left / 2.0)-1
	if timer <=5 and timer >=0:
		if not alarm_player.playing:
			alarm_player.playing = true
			SignalManager.emit_lung_alter_vignette()
		alarm_player.pitch_scale = 1 - (timer-2) * 0.1
		text = str(timer)
	else:
		alarm_player.playing = false
		text = ""
		
