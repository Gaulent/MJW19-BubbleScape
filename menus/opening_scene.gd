extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	#Dialogic.start("debug_dialog")
	Dialogic.start("opening_dialog")


func _on_timeline_ended():
	LevelManagerSingleton.main_game()
