extends KinematicBody2D

var positionLeft = 5
var speedScalar = 0.5
var motion = Vector2(0,0)
var nextPosition = 0

var platformModule1 = preload("res://Bloques/BloquePrototipo1.tscn")
var platformModule2 = preload("res://Bloques/BloquePrototipo2.tscn")
var platformModule3 = preload("res://Bloques/BloquePrototipo3.tscn")

#var world = preload("res://Bloques/Bloque0.tscn")

func _ready():
	print_debug()

func generate_module():
	randomize()
	var platformModules = [platformModule1,platformModule2,platformModule3]
	var localPlatform = platformModules[randi() % platformModules.size()]
	return localPlatform
	
func calculate_next_module_start(positionX):
	return positionX + 250
	
func _physics_process(delta):
	if (nextPosition == 0 || self.position.x >= nextPosition):
		print_debug("BANDERA")
		nextPosition = calculate_next_module_start(self.position.x)
		var module = generate_module().instance()
		module.position = Vector2(self.position.x,-50)
		var world = get_parent()
		world.add_child(module)
		#add_child(module)
		#print_debug(module.get_parent().get_parent().name)

			
	motion.x = 200
	move_and_slide(motion)
