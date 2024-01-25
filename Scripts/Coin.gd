extends Area2D



func _ready():
	$AnimatedSprite.play("coin")

func _on_Coin_body_entered(_body):
	if _body.is_in_group("Player"):
		$AudioStreamPlayer2D.play()
		
		yield($AnimatedSprite,"animation_finished")
	Global.contador += 1

	queue_free()
