extends Area2D




func _on_saw_body_entered(_body):
	if _body.name == "Niguana M":
		_body.queue_free()
		get_tree().reload_current_scene()
