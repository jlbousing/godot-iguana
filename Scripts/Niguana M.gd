extends KinematicBody2D


var VELOCIDAD = 30
var MOVIMIENTO = Vector2(0,0)
var GRAVITY = 20
var JUMP = 500
export var health = 20

export var climbing = false

func _process(_delta):
	pass


func  _physics_process(_delta):
	
	if Input.is_action_pressed("Derecha"):
		MOVIMIENTO.x += VELOCIDAD
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h =false
	elif Input.is_action_pressed("Izquierda"):
		MOVIMIENTO.x -= VELOCIDAD
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
	else:
		MOVIMIENTO.x = 0
		$AnimatedSprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("Saltar"):
			MOVIMIENTO.y = -JUMP
	
	else:
		if Input.is_action_just_released("Saltar"):
			MOVIMIENTO.y += 300
	
	MOVIMIENTO.y += GRAVITY
	MOVIMIENTO = move_and_slide(MOVIMIENTO, Vector2.UP)
	MOVIMIENTO.x = lerp(MOVIMIENTO.x, 0, 0.2)
	
	for i in get_slide_count():
		var obj_colisionado = get_slide_collision(i).collider
		if obj_colisionado.is_in_group("Enemies"):
			Global.health -= 1


func _on_Area2D_body_entered(_body):
	if _body.name == "Enemies":
		Global.health -= 1


func _on_Hurtbox_body_entered(_body):
	if _body.name == "Enemies":
		Global.health -= 1

