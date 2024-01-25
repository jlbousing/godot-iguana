extends Area2D





func _on_BlueBerry_body_entered(_body):
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.play("Collected")
	yield($AnimatedSprite,"animation_finished")
	Global.Blueberry += 1
	
	queue_free()

