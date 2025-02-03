extends AnimatedSprite2D

@onready var fsm:StateMachine = owner.get_node("PlayerStateMachine")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if owner.velocity.x < 0:
		flip_h = true
	if owner.velocity.x > 0:
		flip_h = false

	if fsm.current_state.name == "Breathe":
		animation = "breathe"
	elif not owner.is_on_floor():
		animation = "jump"
	elif abs(owner.velocity.x) > 0:
		animation = "walk"
	else:
		animation = "idle"
