extends State

@onready var player:Player = owner
@onready var bubble_detector: Area2D = %BubbleDetector

func enter():
	bubble_detector.area_entered.connect(breathe)

func physics_process_state(delta: float) -> void:

	player.velocity += player.get_gravity() * delta

	if Input.is_action_just_released("jump") and player.velocity.y < 0:
		player.velocity.y = player.velocity.y/2

	player.handle_horizontal_movement()

	player.move_and_slide()
	
	if player.is_on_floor():
		fsm.transition_to("Walk")

func exit():
	if(bubble_detector.area_entered.is_connected(breathe)):
		bubble_detector.area_entered.disconnect(breathe)

func breathe(area2d: Area2D):
	LevelManagerSingleton.set_checkpoint(player.global_position)
	area2d.queue_free()
	fsm.transition_to("Breathe")
