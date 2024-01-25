extends Area2D


func _ready():
	$AnimatedSprite.play("Chest closed")


func _on_Chest_area_entered(_area):
	$AnimatedSprite.play("Chest open")
	$AudioStreamPlayer2D.play()
	yield($AnimatedSprite,"animation_finished")
	Global.contador += 5
	
	
	get_node("CollisionShape2D").queue_free()
