extends KinematicBody2D


var VELOCIDAD = 70
var movimiento = Vector2(0,0)
var Forgot = true
var GRAVITY = 20
var perseguir:bool = false
var vel_perseguir: int = 200
export var damage_Player = 1 

func _ready():
	$AnimatedSprite.play("Run")
	movimiento.x = VELOCIDAD

func _process(_delta) -> void:
	if $Ray_left.is_colliding():
		Global.health -= 1
		
	if$Ray_right.is_colliding():
		Global.health -= 1
		

	if !perseguir:
		if is_on_wall():
			Forgot = not Forgot
		
		
	if Forgot == true:
		movimiento.x = 50
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false

	else:
		movimiento.x = -50
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
		
		
	movimiento.y += GRAVITY
	
	movimiento = move_and_slide(movimiento, Vector2.UP)
	
	movimiento.x = lerp(movimiento.x, 0, 0.2)
	
	
	for i in get_slide_count():
		var obj_colisionado = get_slide_collision(i).collider
		if obj_colisionado.is_in_group("Niguana M"):
			Global.health -= damage_Player
	

func _on_Area2D_body_entered(_body):
	if _body.name == "Niguana M":
		_body.queue_free()
		get_tree().reload_current_scene()
	

func _on_Hitbox_body_entered(_body):
	if _body.name == "Niguana M":
		_body.queue_free()
		get_tree().quit()
