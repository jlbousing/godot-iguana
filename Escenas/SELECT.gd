extends Button

func _process(_delta):
	if Input.is_action_just_pressed("Select"):
		get_tree().change_scene("res://Bloques/Bloque0.tscn")
