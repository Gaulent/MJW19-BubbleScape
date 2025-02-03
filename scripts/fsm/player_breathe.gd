extends State

@export var lung_timer:Timer
@onready var breathe_audio:AudioStreamPlayer = $BreatheAudio

# Upon moving to this state, initialize the 
# timer with a random duration.
func enter():
	owner.velocity.y *= 0.2
	lung_timer.start()
	breathe_audio.play()
	get_tree().create_timer(0.2).timeout.connect(on_timeout)

func on_timeout():
	fsm.transition_to("Walk")
	