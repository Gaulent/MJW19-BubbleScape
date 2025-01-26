extends Node2D

@onready var animator:AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator.play("death")
	await animator.animation_finished
	if not LevelManagerSingleton.on_the_ending:
		LevelManagerSingleton.reset_level()
	else:
		LevelManagerSingleton.ending_level(true)
