extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var planets = []
var star = 1
var rotation_speed = 0.1
#class planet_1:
var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHights = ProjectSettings.get_setting("display/window/size/height")	
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var my_random_number = rng.randi_range(2, 5)
#	print(my_random_number, " !!!!!!!!!!!!!!!!!!!!")
#	var start =
	var start_ = load("res://scenes/ui/space_objects/planet.tscn")
	star = start_.instance()
#	print(screenWidth)
#	print(screenHights)
	star.init_1("res://icon.png", screenWidth/2, screenHights/2, "tetetetet") 
#	self.add_child(start)
	for i in range(1, my_random_number + 1):
#		print(i)
#		var planet = load("res://scenes/ui/space_objects/planet.tscn")
		var planet_ = load("res://scenes/ui/space_objects/planet.tscn")
		var planet = planet_.instance()
		planet.init_1("res://icon.png", screenWidth/2 + i * 100, screenHights/2, "tetetetewwt")
#		var test = clickable_instance.Planet_info.new(1,[2],3,4)
#		var planet_info = PlanetInfo.new()
#		clickable_instance.init_data(i * 100)
#		clickable_instance.position = Vector2(i*100, i*100)
#		planet.texture.Vector2(0, 0)
		star.add_child(planet)
	self.add_child(star)
	
	pass # Replace with function body.

#func _process(delta):
#	for planet in planets:
#		star/planet.rotation += rotation_speed * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
