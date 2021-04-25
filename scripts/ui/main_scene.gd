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
	star.init_planet("res://icon.png", screenWidth/2, screenHights/2, "tetetetet")
	star.position = Vector2(screenWidth/2, screenHights/2) 
#	self.add_child(start)
	for i in range(1, my_random_number + 1):
		print(i)
#		var planet = load("res://scenes/ui/space_objects/planet.tscn")
		var planet_ = load("res://scenes/ui/space_objects/planet.tscn")
		var planet = planet_.instance()
		planet.init_planet("res://icon.png", screenWidth/2 + i * 100, screenHights/2, "tetetetewwt")
#		planet.position = Vector2(screenWidth/2 + i * 100, screenHights/2)
		planet.position = Vector2(i * 100, 0)
		planets.append(planet)
#		var test = clickable_instance.Planet_info.new(1,[2],3,4)
#		var planet_info = PlanetInfo.new()
#		clickable_instance.init_data(i * 100)
#		clickable_instance.position = Vector2(i*100, i*100)
#		planet.texture.Vector2(0, 0)
		star.add_child(planet)
	self.add_child(star)
	
	pass # Replace with function body.

func _process(delta):
	for planet in planets:
		planet.move(delta)
#		self.angle = fmod(self.angle + (self.rotation_speed * delta), 2 * PI)
#		var offset = Vector2(sin(self.angle), cos(self.angle)) * (self._x_coord - self.screenWidth)
#		move_and_slide(offset)
#		planet.rotation += rotation_speed * delta

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		star.close_passport()
		for planet in planets:
			planet.close_passport()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
