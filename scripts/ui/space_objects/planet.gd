extends KinematicBody2D

#var sprite = Sprite.new()
var radius = 0
var angle = 0
var rotation_speed = 0.2
var _x_coord = 0
var _y_coord = 0
var got_pasport = false
var current_passport
#var screenWidth = ProjectSettings.get_setting("display/window/size/width")
#var screenHights = ProjectSettings.get_setting("display/window/size/height")
func _ready():
	pass
#	print(" wrtfff")
#	var sprite = Sprite.new()
#	sprite.texture = load("res://icon.png") # could use preload
#	self.add_child(sprite)
#	var rectangle_shape = RectangleShape2D.new()
#	rectangle_shape.extents = Vector2(32, 32)
#	var collision_shape = CollisionShape2D.new()
#	collision_shape.shape = rectangle_shape
#	self.add_child(collision_shape)

#func init_planet(path_to_image, x,y,on_click_event):
func init_planet(path_to_image, _radius):
#	print(" im here")
#	radius = _radius
#	var sprite = Sprite.new()
#	sprite.texture = load(path_to_image) # could use preload
#	sprite.position = Vector2(_radius, 0)
#	self.add_child(sprite)
#	var rectangle_shape = RectangleShape2D.new()
#	rectangle_shape.extents = Vector2(32, 32)
##	rectangle_shape.position = Vector2(_radius, 0)
#	var collision_shape = CollisionShape2D.new()
#	collision_shape.shape = rectangle_shape
#	collision_shape.position = Vector2(_radius, 0)
#	self.add_child(collision_shape)
#	self.position = Vector2(_radius, 0)
##	var clickable = load("res://scripts/ui/space_objects/""clickable.gd")
	radius = _radius
	var clickable_ = load("res://scenes/ui/utils/clicable.tscn")
	var clickable_inst = clickable_.instance()
	clickable_inst.connect("clicked", self, "open_passport")
	clickable_inst.init_clicable(path_to_image)
#	clickable_inst.position = Vector2(x, y)
	self.add_child(clickable_inst)

func open_passport():
	if not got_pasport:
		var passport_ = load("res://scenes/ui/space_object_passport.tscn")
		var passport = passport_.instance()
		print(_x_coord, " ",  _y_coord)
	#	passport.rect_global_position = Vector2(_x_coord, _y_coord)
	#	passport.rect_position = Vector2(_x_coord, _y_coord)
		print(" got ckicked")
		current_passport = passport
		self.add_child(passport)
		got_pasport = true
		
		
func close_passport():
	if got_pasport:
		self.remove_child(current_passport)
		got_pasport = false
#	emit_signal("clicked_1")
#class PlanetInfo:
#	var type: int = 0 
#	var know_info: Array = []
#	var path_to_image: String = ""
#	var _radius_from_star: float = 0
#	export(float) var rotation_speed = 1.0
#	var angle = 0
#	var texture = "" 
#
#	func _init(_type: int, _know_info: Array, _path_to_image: String, __radius_from_star: float):
#		print('_init: ', _type, " ", _know_info, " ", _path_to_image)
#		type = _type
#		know_info= _know_info
#		path_to_image = _path_to_image
#		_radius_from_star = __radius_from_star
#		sprite.texture = load(path_to_image)
#		self.add_child(sprite)
#	func get_texture():
#		return load(path_to_image)
#ret
#func _physics_process(delta):
##
#	self.angle = fmod(self.angle + (self.rotation_speed * delta), 2 * PI)
#	var offset = Vector2(sin(self.angle), cos(self.angle)) * (self._x_coord - self.screenWidth)
#	move_and_slide(offset)
func move(delta):
	pass
#	self.angle = fmod(self.angle + (self.rotation_speed * delta), PI/2)
#	var offset = Vector2(sin(self.angle), cos(self.angle)) * (self._x_coord)
#	move_and_slide(offset)
#func _process(delta):
#	$Sprite/Pivot.rotation += rotation_speed * delta
	
#func _process(delta):x
#	$Sprite/Pivot.rotation += rotation_speed * delta
