extends Node2D

@onready var spawn_timer:Timer = $Timer
@onready var small_bubble_timer:Timer = $SmallBubbleTimer
@export var bubble_scene:PackedScene
@export var small_bubble_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.timeout.connect(spawn_bubble)
	small_bubble_timer.timeout.connect(spawn_small_bubble)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_bubble() -> void:
	var current_bubble:Node2D = bubble_scene.instantiate()
	
	add_child(current_bubble)
	current_bubble.global_position = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_small_bubble() -> void:
	var current_bubble:Node2D = small_bubble_scene.instantiate()

	add_child(current_bubble)
	current_bubble.global_position = global_position
	small_bubble_timer.start(randf_range(0.5, 2))
