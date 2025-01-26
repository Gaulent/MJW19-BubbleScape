extends Node

@onready var animator:AnimationPlayer = $TransitionScreen/AnimationPlayer
@export var start_menu:PackedScene
@export var main_scene:PackedScene
@export var opening_scene:PackedScene

var on_the_ending = false

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
	get_tree().change_scene_to_packed(main_scene)
	animator.play("fade_in")

# Called when the node enters the scene tree for the first time.
func reset_level():
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().reload_current_scene()
	animator.play("fade_in")

	
func final_malo():
	print("FINAL MALO")


func final_bueno():
	print("FINAL BUENO")
	