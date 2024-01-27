extends KinematicBody2D

var positionLeft = 5
var speedScalar = 0.5
var motion = Vector2(0,0)
var nextPosition = 0

var platformModule1 = preload("res://Bloques/BloquePrototipo1.tscn")
var platformModule2 = preload("res://Bloques/BloquePrototipo2.tscn")
var platformModule3 = preload("res://Bloques/BloquePrototipo3.tscn")

func generate_module():
	randomize()
	var platformModules = [platformModule1,platformModule2,platformModule3]
	var localPlatform = platformModules[randi() % platformModules.size()]
	return localPlatform
	
func calculate_next_module_start(positionX):
	return positionX + 300
	
func _physics_process(delta):
	print_debug(nextPosition)
	if (nextPosition == 0 || self.position.x >= nextPosition):
		nextPosition = calculate_next_module_start(self.position.x)
		if nextPosition != 0:
			var module = generate_module().instance()
			module.position = Vector2(self.position.x,-50)
			var world = get_parent()
			world.add_child(module)
			
	motion.x = 200
	move_and_slide(motion)
