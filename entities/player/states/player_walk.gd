extends State

@onready var player:Player = owner

func physics_process_state(delta: float) -> void:

	player.handle_gravity(delta)
	player.handle_horizontal_movement()
	
	if Input.is_action_just_pressed("jump") and player.coyote_timer.time_left > 0:
		fsm.transition_to("Jump")

	player.move_and_slide()
	
