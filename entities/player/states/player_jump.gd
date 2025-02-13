extends State

@onready var player:Player = owner

func enter():
	player.velocity.y = player.jump_velocity

func physics_process_state(delta: float) -> void:

	player.handle_gravity(delta)
	player.handle_horizontal_movement()

	if Input.is_action_just_released("jump") and player.velocity.y < 0:
		player.velocity.y = player.velocity.y/2
		fsm.transition_to("Walk")
		
	if player.velocity.y >= 0:
		fsm.transition_to("Walk")

	player.move_and_slide()

