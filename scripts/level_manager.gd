extends Node

@onready var animator:AnimationPlayer = $TransitionScreen/AnimationPlayer
@export var start_menu:PackedScene
@export var main_scene:PackedScene
@export var opening_scene:PackedScene
@export var ending_scene:PackedScene

var on_the_ending = false
var good_ending:=false
var checkpoint_position = null


func _ready() -> void:
	animator.play("fade_in")
	
func start_game():
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().change_scene_to_packed(opening_scene)
	animator.play("fade_in")
	
func main_game():
	animator.play("fade_out")
	await animator.animation_finished
	on_the_ending = false
	checkpoint_position = null
	get_tree().change_scene_to_packed(main_scene)
	animator.play("fade_in")

func set_checkpoint(new_pos:Vector2):
	checkpoint_position = new_pos
	print("new_checkpoint")

# Called when the node enters the scene tree for the first time.
func reset_level():
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().reload_current_scene()
	animator.play("fade_in")

	
func ending_level(good_ending_selected):
	good_ending = good_ending_selected
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().change_scene_to_packed(ending_scene)
	animator.play("fade_in")

func restart_to_title():
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().change_scene_to_packed(start_menu)
	animator.play("fade_in")