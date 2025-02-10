extends State

@onready var sprite:AnimatedSprite2D = %AnimatedSprite2D


func enter():
	
	await get_tree().create_timer(0.5).timeout
	var tween:= create_tween()
	tween.tween_property(sprite, "position:y", 460, 2.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.finished

	if not LevelManagerSingleton.on_the_ending:
		LevelManagerSingleton.reset_level()
	else:
		LevelManagerSingleton.ending_level(true)

