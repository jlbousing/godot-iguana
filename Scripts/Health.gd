extends CanvasLayer



func _proces(_delta):
	$health.text = str(Global.health)
	if Global.health >= 0:
		$health.text = str(Global.health)
	else:
		$health.text = str(0)







