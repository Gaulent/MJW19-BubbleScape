extends Node

@onready var animator:AnimationPlayer = $TransitionScreen/AnimationPlayer

func _ready() -> void:
	animator.play("fade_in")

# Called when the node enters the scene tree for the first time.
func reset_level():
	animator.play("fade_out")
	await animator.animation_finished
	get_tree().reload_current_scene()
	animator.play("fade_in")


