extends CharacterBody2D
class_name Player

@onready var lung_timer:Timer = $LungTimer
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@export var dead_player_scene:PackedScene
@onready var fsm:StateMachine = $PlayerStateMachine

func _ready() -> void:
	lung_timer.timeout.connect(die)
	if LevelManagerSingleton.checkpoint_position:
		global_position = LevelManagerSingleton.checkpoint_position



func die():
	var dead_player:Node2D = dead_player_scene.instantiate()
	dead_player.global_position = global_position
	owner.add_child(dead_player)
	queue_free()
