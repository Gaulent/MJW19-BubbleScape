extends State

@onready var lung_timer:Timer = %LungTimer
@onready var breathe_audio:AudioStreamPlayer = $BreatheAudio

func enter():
	owner.velocity.y *= 0.2
	lung_timer.start()
	breathe_audio.play()
	get_tree().create_timer(0.2).timeout.connect(on_timeout)

func on_timeout():
	fsm.transition_to("Walk")