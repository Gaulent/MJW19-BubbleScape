extends State

@onready var player:Player = owner

func physics_process_state(_delta: float) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = player.jump_velocity

	player.handle_horizontal_movement()		

	player.move_and_slide()
	
	if not player.is_on_floor():
		fsm.transition_to("Jump")
