extends Area2D

@export var speed:float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start: float =  position.x
	var end: float = position.x + 10
	var tween:= create_tween().set_loops()
	tween.tween_property(self, "position:x", end, 1).from(start).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "position:x", start, 1).from(end).set_trans(Tween.TRANS_SINE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta
