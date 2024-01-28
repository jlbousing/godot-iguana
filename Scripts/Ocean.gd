extends KinematicBody2D

onready var player = get_parent().get_node("Niguana M")

func _physics_process(delta):
	self.position.x = player.position.x
