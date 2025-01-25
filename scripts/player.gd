extends CharacterBody2D


@export var SPEED:float = 150.0
@export var JUMP_VELOCITY:float = -500.0/ 2.0
@export var inertia:float = 20.0
@onready var lung_timer:Timer = $LungTimer
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	lung_timer.timeout.connect(die)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		#velocity.y = move_toward(velocity.x, get_gravity() * delta, SPEED/inertia)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		#velocity.x = direction * SPEED
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED/inertia)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/inertia)

	if velocity.x < 0:
		sprite.flip_h = true
	if velocity.x > 0:
		sprite.flip_h = false
		

	move_and_slide()

func die():
	print("MUERTOMATAO")

func breathe():
	velocity.y *= 0.2
	lung_timer.start()