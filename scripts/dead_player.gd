extends Node2D

@onready var animator:AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator.play("death")
	await animator.animation_finished
	LevelManagerSingleton.reset_level()
