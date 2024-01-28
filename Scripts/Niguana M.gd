extends KinematicBody2D


var VELOCIDAD = 65
var MOVIMIENTO = Vector2(0,0)
var GRAVITY = 20
var JUMP = 650

var isInWarnZone = false
var onLadder = false

onready var ocean = get_parent().get_node("Ocean")

export var health = 20

export var climbing = false

func _process(_delta):
	pass


func  _physics_process(_delta):
	if DataSingleton.contLife <= 0:
			ocean.queue_free()
			queue_free()
			#get_tree().change_scene("res://Escenas/GameOver.tscn")
			get_tree().change_scene("res://Escenas/GAME OVER.tscn")
	if onLadder:
		if Input.is_action_pressed("ui_up"):
			MOVIMIENTO.y -= 30
			$AnimatedSprite.play("Walk")
		if MOVIMIENTO.y == 0:
			$AnimatedSprite.play("Idle")	
	else:		
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

signal less_life
signal plus_life
	
func _on_Hurtbox_area_entered(area):
	print_debug(area.name)
	if area.name == "WarmArea":
		#print_debug("zona segura")
		emit_signal("plus_life")
		isInWarnZone = true
	elif area.name == "BurnArea" || area.name == "waterarea":
		#ocean.queue_free()
		#queue_free()
		#get_tree().change_scene("res://Escenas/GameOver.tscn")
		get_tree().change_scene("res://Escenas/GAME OVER.tscn")
	if area.is_in_group("starway"):
		onLadder = true


func _on_Timer_timeout():
	print_debug("time out")
	if !isInWarnZone:
		#DataSingleton.contLife -= 25
		emit_signal("less_life")
		#print_debug(DataSingleton.contLife)


func _on_Hurtbox_area_exited(area):
	print_debug(area.name)
	if area.name == "WarmArea":
		isInWarnZone = false
		print_debug("SE SALE DE ZONA SEGURA")
	if area.name == "Ladder":
		onLadder = false
