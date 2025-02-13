extends Area2D

@onready var audio:AudioStreamPlayer = $AudioStreamPlayer
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@onready var shape:CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(pop)

func pop(_body: Node2D):
	audio.play()
	sprite.visible = false
	shape.set_deferred("disabled", true)
	await audio.finished
	queue_free()