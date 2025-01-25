extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(destroy_bubble)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func destroy_bubble(node2d:Area2D) -> void:
	node2d.queue_free()
