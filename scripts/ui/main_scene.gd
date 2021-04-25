extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
#var planets = []
var star = 1
#var rotation_speed = 0.1
var space_object_preload= preload("res://scenes/ui/space_objects/planet.tscn")
var ship_singltone_preload = preload("res://scripts/singletones/ship.gd")
#var ship_singltone_inst = ship_singltone_preload.instance()
var star_map_singletone_preload= preload("res://scripts/singletones/star_map.gd")
#var star_map_singletone_instance = star_map_singletone_preload.instance()
#class planet_1:
var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHights = ProjectSettings.get_setting("display/window/size/height")
var ship_inst
var shipe_rotating_around 
var space_obj_info_to_instanc = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var my_random_number = rng.randi_range(2, 5)
#	my_random_number = 0
#	print(my_random_number, " !!!!!!!!!!!!!!!!!!!!")
#	var start =
#	var start_ = load("res://scenes/ui/space_objects/planet.tscn")
	star = space_object_preload.instance()
#	ship_singltone
#	print(screenWidth)
#	print(screenHights)
#	print("_______________________________")
	var current_star_ = Ship.get_current_star()
#	print(current_star_)
	var star_info = StarMap.get_star_system_info(current_star_)
#	print(a)
#	for i in a: 
#		print(i)
#	print("_______________________________")
	var kwargs = {"frame_seed":star_info.star.frame_seed, "animation":"star"} 
	kwargs["space_object_info"] = star_info
	star.init_sapce_obj(kwargs, 0, "star", 0)
	star.position = Vector2(screenWidth/2, screenHights/2) 
	space_obj_info_to_instanc[star_info] = star
	
	
	kwargs = {"frame_seed":0, "animation":"spaceship"} 
	ship_inst = space_object_preload.instance()
	ship_inst.init_sapce_obj(kwargs, screenWidth/8, "ship", 0.4)
	star.add_child(ship_inst)
	shipe_rotating_around = star
#	kwargs = {"test":2, "animation":"terrestrial planet"} 
	var a 
	for planet_info in star_info.planets:
#		print(i)
#		var planet = load("res://scenes/ui/space_objects/planet.tscn")
#		var planet_ = load("res://scenes/ui/space_objects/planet.tscn")
		var planet = space_object_preload.instance()
		kwargs['animation'] = planet_info.type_name
#		print(planet_info.type_name)
		kwargs['frame_seed'] = planet_info.frame_seed
		kwargs['name'] = planet_info.name_
		kwargs["space_object_info"] = planet_info
		print(planet_info.range_from_star, " range")
#		print(kwargs['test'])
#		planet.init_sapce_obj("res://icon.png", screenWidth/2 + i * 100, screenHights/2, "tetetetewwt")
		planet.init_sapce_obj(kwargs, planet_info.range_from_star, "planet", 0.0005 * planet_info.range_from_star)
		space_obj_info_to_instanc[planet_info] = planet		
#		a = planet_info
#		kwargs = {"test":i, "animation":"gas giants"} 
#		planet.position = Vector2(screenWidth/2 + i * 100, screenHights/2)
#		planet.position = Vector2(i * 100, 0)
#		planets.append(planet)
#		var test = clickable_instance.Planet_info.new(1,[2],3,4)
#		var planet_info = PlanetInfo.new()
#		clickable_instance.init_data(i * 100)
#		clickable_instance.position = Vector2(i*100, i*100)
#		planet.texture.Vector2(0, 0)
		star.add_child(planet)
	self.add_child(star)
#	for i in space_obj_info_to_instanc:
#		print(i)
#		print("___________________")
#	self.move_ship_to(a)
#	self.move_ship_to(star_info)
	pass # Replace with function body.

func _process(delta):
	$Camera2D.position = (get_viewport().get_mouse_position() + ship_inst.position)/2
	var star_objs =  star.get_children()
	for star_related_obj in star_objs:
#		print(" 123123")
		if star_related_obj is KinematicBody2D:
#			if planet.objecy_type == "ship":
#				print("33333333333333333333333")
#		planet.rotate_y(rotation_speed * delta)
#			planet.rotation += rotation_speed * delta
#		planet.move(delta)
			self.rotate_obj(star_related_obj, delta)
			var planet_related =  star_related_obj.get_children()
			if ship_inst in planet_related:
				self.rotate_obj(ship_inst, delta)
#			var currnet_pos = star_related_obj.position
##			print(currnet_pos)
#			star_related_obj.angle = fmod(star_related_obj.angle +
#			 (star_related_obj.rotation_speed * delta), 2 * PI)
#			var pos = Vector2(sin(star_related_obj.angle) * star_related_obj.radius,
#			 cos(star_related_obj.angle) * star_related_obj.radius)
#			star_related_obj.position = pos
#			move_and_slide(offset)
#		planet.rotation += rotation_speed * delta

#sr_arf mejdi zvezdoi i mishkoi
func rotate_obj(related_obj, delta):
			var currnet_pos = related_obj.position
#			print(currnet_pos)
			related_obj.angle = fmod(related_obj.angle +
			 (related_obj.rotation_speed * delta), 2 * PI)
#			print(planet.angle)
#			print(planet.radius)
#			var pos = Vector2(sin(planet.angle) * currnet_pos[0], cos(planet.angle) * planet.radius)
			var pos = Vector2(sin(related_obj.angle) * related_obj.radius,
			 cos(related_obj.angle) * related_obj.radius)
			related_obj.position = pos
func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		star.close_passport()
		var star_planets =  star.get_children()
		for planet in star_planets:
			if planet is KinematicBody2D:
				planet.close_passport()
#	elif event is InputEventMouseMotion:
#		position = get_global_mouse_position()
#	$Camera2D.position = (event.position + ship_inst.position)/2

func move_ship_to(move_to):
#	if move_to not in space_obj_info_to_instanc :
#		print("aaiaiiai")
	print("moving to: " , move_to)
	shipe_rotating_around.remove_child(ship_inst)
	var inst = space_obj_info_to_instanc[move_to]
	inst.add_child(ship_inst)
	shipe_rotating_around = inst
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

#	pass
