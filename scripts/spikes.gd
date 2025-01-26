extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(pop)

func pop(body: Node2D):
	body.die()