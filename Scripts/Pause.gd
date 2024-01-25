extends Control


func _input(_event):

	if Input.is_action_just_pressed("Pause"):
		$AudioStreamPlayer.play()
		get_tree().paused = not get_tree().paused
	if get_tree().paused == false:
		$ColorRect.visible =false
	else:
		$ColorRect.visible =true

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Escenas/GUI.tscn")
		$AudioStreamPlayer.play()
		get_tree().paused = not get_tree().paused
	if get_tree().paused == false:
		$ColorRect.visible =false
	else:
		$ColorRect.visible =true

func _on_EXIT_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://Escenas/GUI.tscn")

func _on_CONTINUE_pressed():
	get_tree().paused = false
	get_tree().current_scene
