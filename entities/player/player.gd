extends CharacterBody2D
class_name Player

@export var speed:float = 150.0
@export var jump_velocity:float = -320
@export var inertia:float = 20.0

@onready var lung_timer:Timer = $LungTimer
@onready var coyote_timer:Timer = $CoyoteTimer
@onready var fsm:StateMachine = $PlayerStateMachine
@onready var camera:Camera2D = $Camera2D
@onready var detector_shape:CollisionShape2D = $BubbleDetector/BubbleDetectorShape
@onready var detector:Area2D = $BubbleDetector

func _ready() -> void:
	lung_timer.timeout.connect(die)
	detector.area_entered.connect(breathe)
	if LevelManagerSingleton.checkpoint_position:
		global_position = LevelManagerSingleton.checkpoint_position
		camera.reset_smoothing()

func die():
	fsm.transition_to("Dead")
	
func _physics_process(_delta: float) -> void:
	if is_on_floor():
		coyote_timer.start()
	detector_shape.disabled = is_on_floor() || fsm.current_state.name=="Dead"

func handle_horizontal_movement():
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, 2*speed/inertia)
	else:
		velocity.x = move_toward(velocity.x, 0, speed/inertia)

func handle_gravity(delta: float):
	velocity += get_gravity() * delta

func breathe(area2d: Area2D):
	LevelManagerSingleton.set_checkpoint(global_position)
	area2d.queue_free()
	fsm.transition_to("Breathe")
