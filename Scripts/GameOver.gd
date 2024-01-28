extends Control

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if Input.is_action_pressed("Select"):
				on_key_pressed()

func on_key_pressed():
	DataSingleton.contLife = 100
	get_tree().change_scene("res://Bloques/Bloque0.tscn")
