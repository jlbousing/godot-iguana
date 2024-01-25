extends AnimatedSprite
  
var Damage_Player = 10
func _ready():
	$AnimationPlayer.play("Moving")               


func _process(_delta) -> void:
	
	if $Right_Ray.is_colliding():
		Global.health = -1
	
	if $Left_Ray.is_colliding():
		Global.health = -1
		
func _on_Area2D_body_entered(_body):
	if _body.name == "Niguana M":
		_body.queue_free()
		get_tree().reload_current_scene()

	

