extends CharacterBody2D



@export var SPEED:float = 150.0
@export var JUMP_VELOCITY:float = -500.0/ 2.0
@export var inertia:float = 20.0
@onready var lung_timer:Timer = $LungTimer
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@export var dead_player_scene:PackedScene
@onready var breathe_audio:AudioStreamPlayer = $BreatheAudio

func _ready() -> void:
	lung_timer.timeout.connect(die)
	if LevelManagerSingleton.checkpoint_position:
		global_position = LevelManagerSingleton.checkpoint_position

func _physics_process(delta: float) -> void:
	if sprite.animation == "breathe":
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		#velocity.y = move_toward(velocity.x, get_gravity() * delta, SPEED/inertia)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_released("jump") and not is_on_floor() and velocity.y < 0:
		velocity.y = velocity.y/2		

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

	if not is_on_floor():
		sprite.animation = "jump"
	elif abs(velocity.x) > 0:
		sprite.animation = "walk"
	else:
		sprite.animation = "idle"
		

	move_and_slide()

func die():
	var dead_player:Node2D = dead_player_scene.instantiate()
	dead_player.global_position = global_position
	owner.add_child(dead_player)
	queue_free()

func breathe():
	velocity.y *= 0.2
	lung_timer.start()
	sprite.animation = "breathe"
	breathe_audio.play()
	await get_tree().create_timer(0.2).timeout
	sprite.animation = "idle"