extends CharacterBody2D
class_name Player

@export var speed:float = 150.0
@export var jump_velocity:float = -320
@export var inertia:float = 20.0

@onready var lung_timer:Timer = $LungTimer
@onready var fsm:StateMachine = $PlayerStateMachine

func _ready() -> void:
	lung_timer.timeout.connect(die)
	if LevelManagerSingleton.checkpoint_position:
		global_position = LevelManagerSingleton.checkpoint_position

func die():
	fsm.transition_to("Dead")

func handle_horizontal_movement():
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, 2*speed/inertia)
	else:
		velocity.x = move_toward(velocity.x, 0, speed/inertia)

		