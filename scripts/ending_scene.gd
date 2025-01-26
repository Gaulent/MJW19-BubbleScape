extends Node2D

@onready var start_button:TextureButton = $TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.button_down.connect(restart_game)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	#Dialogic.start("debug_dialog")
	if LevelManagerSingleton.good_ending:
		Dialogic.start("end_dialog_good")
	else:
		Dialogic.start("end_dialog_bad")


func _on_timeline_ended():
	start_button.visible = true
	
	
func restart_game():
	LevelManagerSingleton.restart_to_title()
	