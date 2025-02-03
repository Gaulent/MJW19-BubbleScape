extends State

@export var SPEED:float = 150.0
@export var JUMP_VELOCITY:float = -500.0/ 2.0
@export var inertia:float = 20.0



func physics_process_state(delta: float) -> void:

	# Add the gravity.
	if not owner.is_on_floor():
		owner.velocity += owner.get_gravity() * delta
	#velocity.y = move_toward(velocity.x, get_gravity() * delta, SPEED/inertia)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and owner.is_on_floor():
		owner.velocity.y = JUMP_VELOCITY

	if Input.is_action_just_released("jump") and not owner.is_on_floor() and owner.velocity.y < 0:
		owner.velocity.y = owner.velocity.y/2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		#velocity.x = direction * SPEED
		owner.velocity.x = move_toward(owner.velocity.x, direction * SPEED, 2*SPEED/inertia)
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, SPEED/inertia)


	owner.move_and_slide()