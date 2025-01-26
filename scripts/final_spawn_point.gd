extends Node2D

@onready var small_bubble_timer:Timer = $SmallBubbleTimer
@onready var trigger_area:Area2D = $Area2D
@onready var shape_area:CollisionShape2D = $Area2D/CollisionShape2D
@export var bubble_scene:PackedScene
@export var small_bubble_scene:PackedScene
@onready var dialogbox:Node2D = $DialogBox
@onready var dialogtext:RichTextLabel = $DialogBox/PanelContainer/RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	small_bubble_timer.timeout.connect(spawn_small_bubble)
	trigger_area.body_entered.connect(start_end_sequence)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_end_sequence(body:Node2D) -> void:
	LevelManagerSingleton.on_the_ending=true
	dialogbox.visible = true
	var tween:= create_tween()
	tween.tween_property(dialogtext, "visible_ratio", 1, 2).set_trans(Tween.TRANS_SINE)
	await get_tree().create_timer(3.5).timeout
	shape_area.disabled = true
	var current_bubble:Node2D = bubble_scene.instantiate()
	
	add_child(current_bubble)
	current_bubble.global_position = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_small_bubble() -> void:
	var current_bubble:Node2D = small_bubble_scene.instantiate()

	add_child(current_bubble)
	current_bubble.global_position = global_position
	small_bubble_timer.start(randf_range(0.5, 2))
