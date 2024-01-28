extends KinematicBody2D

onready var player = get_parent().get_node("Niguana M")
onready var waterarea = get_node("waterarea")

func _physics_process(delta):
	#self.position.x = player.position.x
	if player != null && player.position != null:
		waterarea.position.x = player.position.x
		self.position.x = player.position.x
