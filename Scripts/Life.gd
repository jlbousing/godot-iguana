extends Area2D


func _ready():
	$AnimatedSprite.play("Egg")


func _on_Life_area_entered(_area):
	$AnimatedSprite.play("Egg Cracked")
	$AudioStreamPlayer2D.play()
	yield($AnimatedSprite,"animation_finished")
	Global.health += 5
	
	get_node("CollisionShape2D").queue_free()
