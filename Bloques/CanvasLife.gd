extends CanvasLayer

var iguana1 = ResourceLoader.load("res://Vidas/iguana1.png")
var iguana2 = ResourceLoader.load("res://Vidas/iguana2.png")
var iguana3 = ResourceLoader.load("res://Vidas/iguana3.png")

var gameOver = preload("res://Escenas/GameOver.tscn")

func _ready():
	$Life.texture = ResourceLoader.load("res://Vidas/iguana1.png")

func _on_life_lost():
	$Life.texture = iguana2 

func update_life_sprite():
	print_debug(DataSingleton.contLife)
	if DataSingleton.contLife >= 100:
		$Life.texture = iguana1
	elif DataSingleton.contLife > 50 && DataSingleton.contLife <= 75:
		$Life.texture = iguana2
	else:
		$Life.texture = iguana3	

func _on_Niguana_M_less_life():
	DataSingleton.contLife -= 25
	update_life_sprite()
	if DataSingleton.contLife == 0:
		get_tree().change_scene("res://Escenas/GameOver.tscn")


func _on_Niguana_M_plus_life():
	if DataSingleton.contLife < 100:
		DataSingleton.contLife += 25
		update_life_sprite()
