extends Control




func _on_START_pressed():
		get_tree().change_scene("res://Bloques/Bloque0.tscn")
	


func _on_EXIT_pressed():
		get_tree().quit()


func _on_CONTINUE_pressed():
	get_tree().paused = false
	self.queue_free()
