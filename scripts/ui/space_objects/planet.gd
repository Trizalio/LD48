extends KinematicBody2D

#var sprite = Sprite.new()
var radius = 0
var angle = 0
var rotation_speed = 0.1
var _x_coord = 0
var _y_coord = 0
var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHights = ProjectSettings.get_setting("display/window/size/height")
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

func init_1(path_to_image, x,y,on_click_event):
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
	_x_coord = x
	_y_coord = y
	var clickable = load("res://scenes/ui/utils/clicable.tscn")
	var clack = clickable.instance()
	clack.init_clicable(on_click_event ,path_to_image, x, y)
	self.add_child(clack)

class PlanetInfo:
	var type: int = 0 
	var know_info: Array = []
	var path_to_image: String = ""
	var _radius_from_star: float = 0
	export(float) var rotation_speed = 1.0
	var angle = 0
	var texture = "" 
	
	func _init(_type: int, _know_info: Array, _path_to_image: String, __radius_from_star: float):
		print('_init: ', _type, " ", _know_info, " ", _path_to_image)
		type = _type
		know_info= _know_info
		path_to_image = _path_to_image
		_radius_from_star = __radius_from_star
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

#func _process(delta):
#	$Sprite/Pivot.rotation += rotation_speed * delta
	
#func _process(delta):x
#	$Sprite/Pivot.rotation += rotation_speed * delta
