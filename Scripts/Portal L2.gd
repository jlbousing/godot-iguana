extends Area2D



func _on_Portal_L2_body_entered(_body):
	if _body.name == "Niguana M":
		get_tree().change_scene("res://Escenas/Partners Niguana.tscn")

