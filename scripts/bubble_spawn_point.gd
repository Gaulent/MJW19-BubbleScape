extends Node2D

@onready var spawn_timer:Timer = $Timer
@export var bubble_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.timeout.connect(spawn_bubble)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_bubble() -> void:
	var current_bubble:Node2D = bubble_scene.instantiate()
	
	add_child(current_bubble)
	current_bubble.global_position = global_position
