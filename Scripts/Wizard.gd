extends KinematicBody2D


var VELOCIDAD = 70
var movimiento = Vector2(0,0)
var Forgot = true
var GRAVITY = 20
var perseguir:bool = false
var vel_perseguir: int = 200
export var damage_Player = 1 


func _ready():
	$AnimatedSprite.play("IDLE")
	movimiento.x = VELOCIDAD

func _process(_delta) -> void:
	if !perseguir:
		if is_on_wall():
			Forgot = not Forgot
		
		
	if Forgot == true:
		movimiento.x = 50
		$AnimatedSprite.play("WALK")
		$AnimatedSprite.flip_h = false

	else:
		movimiento.x = -50
		$AnimatedSprite.play("WALK")
		$AnimatedSprite.flip_h = true
		
		
	movimiento.y += GRAVITY
	
	movimiento = move_and_slide(movimiento, Vector2.UP)
	
	movimiento.x = lerp(movimiento.x, 0, 0.2)
	


func _on_Hurtbox_body_entered(_body):
	if _body.name == "Niguana M":
		_body.queue_free()
		get_tree().reload_current_scene()
