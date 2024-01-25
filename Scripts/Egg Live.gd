extends Area2D


func _ready():
	$AnimatedSprite.play("Egg")
	
	

func _on_Egg_Live_body_entered(body):
	$AnimatedSprite.play("Egg Cracked")
	
	yield($AnimatedSprite,"animation_finished")
	Global.contador += 10
	
	get_node("CollisionShape2D").queue_free()
