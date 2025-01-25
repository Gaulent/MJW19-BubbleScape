extends Label

@onready var current_time:Timer = $"../LungTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var timer:int = int(current_time.time_left / 2.0)-1
	if timer <=5 and timer >=0:
		text = str(timer)
	else:
		text = ""
