extends KinematicBody2D

#var sprite = Sprite.new()
var radius = 0
var angle = 0
var rotation_speed = 0.2
var _x_coord = 0
var _y_coord = 0
var rand_int_start_pos_offset = 0 
var got_pasport = false
var passport_ = preload("res://scenes/ui/space_object_passport.tscn")
var all_kwargs = {}
signal close_all
var space_object_info
enum OBGECT_TYPES{
  star,
  ship,
  planet
}
var objecy_type
var current_passport

# t -10 + 25 green
# t <10 >25 red


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

#func init_sapce_obj(path_to_image, x,y,on_click_event):
func init_sapce_obj(kwargs, _radius, _objecy_type, _rotation_speed):
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
	objecy_type = _objecy_type
#	if objecy_type == "ship":
	rotation_speed = _rotation_speed
	radius = _radius
	var clickable_ = load("res://scenes/ui/utils/clicable.tscn")
	var clickable_inst = clickable_.instance()
	rand_int_start_pos_offset = kwargs["rand_int_start_pos_offset"]
	if objecy_type != "ship":
		space_object_info = kwargs["space_object_info"]
	all_kwargs = kwargs
	clickable_inst.connect("clicked", self, "open_passport")
	var number_of_framse = clickable_inst.animate_sprite.get_sprite_frames().get_frame_count(kwargs["animation"])
#	print(number_of_framse)
	
	var frame_number = kwargs["frame_seed"] % number_of_framse
	clickable_inst.init_clicable(kwargs["animation"], frame_number)
#	clickable_inst.position = Vector2(x, y)
	self.add_child(clickable_inst)

func open_passport():
#	print("in open_passport")
	emit_signal("close_all")
	if not got_pasport:
		if objecy_type == "ship":
			draw_ship_menu()
		elif objecy_type == "planet":
			draw_planet_menu()
		else:
			pass
#			var passport = passport_.instance()
#	#		print(_x_coord, " ",  _y_coord)
#		#	passport.rect_global_position = Vector2(_x_coord, _y_coord)
#		#	passport.rect_position = Vector2(_x_coord, _y_coord)
#	#		print(" got ckicked")
#			current_passport = passport
#			self.add_child(passport)
		got_pasport = true
		
		
func close_passport():

	if got_pasport:
		if objecy_type == "ship":
			close_ship_menu()
		elif objecy_type == "planet":
			close_planet_menu()
		else:
			self.remove_child(current_passport)
		
	got_pasport = false
#	if got_pasport:
#		emit_signal("close_all")
		


var circular_menu_class = preload("res://scenes/circular_menu.tscn")
var ship_menu = null
var planet_menu = null


func close_ship_menu():
	print(" tring to close close_ship_menu")
	if ship_menu != null:
		print('close ship_menu')
		ship_menu.hide()
		ship_menu = null


func draw_ship_menu():
	if ship_menu != null:
		print('assert failed: attempt to create new ship_menu, while old exists; close old')
		close_ship_menu()
	var actions = Ship.get_actions()
	ship_menu = circular_menu_class.instance()
	ship_menu.init(actions, 1)
	ship_menu.connect("action_clicked_2",self, "close_passport")
	self.add_child(ship_menu)
	
	
func draw_planet_menu():

	if planet_menu != null:
		print('assert failed: attempt to create new ship_menu, while old exists; close old')
		close_ship_menu()
#	var space_object_info = all_kwargs["space_object_info"]
#	var actions = Ship.get_actions()
	planet_menu = circular_menu_class.instance()
	var actions = [ ["move", Color( 0.96, 0.96, 0.96, 1 )]
#		"name: " + String(space_object_info.name_)
	,[get_str_or_none("gravity: " ,space_object_info.gravity), get_colore(space_object_info.gravity)]
	,[get_str_or_none("temperature: ", space_object_info.temperature) , get_colore(space_object_info.temperature)]
	,[get_str_or_none("water: ", space_object_info.water), get_colore(space_object_info.water)]
	,[get_str_or_none("atmosphere:" , space_object_info.atmosphere), get_colore(space_object_info.atmosphere)]
#	,get_str_or_none("resources: ", space_object_info.resources)
#	,get_str_or_none("life: " ,space_object_info.life)
#	,"type_name:  " ,space_object_info.type_name
	
	]
	
#	name_: String
#	type_name: String # PlanetType
#	frame_seed: int
#	var gravity: float = -1
#	var temperature: float = -1
#	var water: float = -1
#	var atmosphere: float = -1
#	var resources: float = -1
#	var life: float = -1
	planet_menu.init(actions, 1, true)
	planet_menu.connect("action_clicked_2",self, "close_passport")
	planet_menu.connect("action_clicked", self, "planet_menu_clicked", [space_object_info])
	planet_menu.set_scale(Vector2(2.2, 2.2))
	self.add_child(planet_menu)
	
func planet_menu_clicked(action, type, planet_info):
	Ship.move_ship_to(planet_info)
	
func close_planet_menu():
	if planet_menu != null:
		print('close planet_menu')
		planet_menu.hide()
		planet_menu = null


func get_str_or_none(name_, value):
	if value == -1:
		return name_ + ": unknown"
	elif value <= 0.25:
		return name_ + ": bad"
	elif value > 0.25 and  value <= 0.5:
		return name_ + ": risky"
	elif value > 0.5 and  value <= 0.75:
		return name_ + ": acceptable"
	elif value > 0.75 and  value <= 1:
		return name_ + ": good"
	pass
func get_colore( value):
	if value == -1:
		return Color( 0.5, 0.5, 0.5, 1 )
	elif value <= 0.25:
		return Color( 0.55, 0, 0, 1 )
	elif value > 0.25 and  value <= 0.5:
		return Color( 1, 0.65, 0, 1 )
	elif value > 0.5 and  value <= 0.75:
		return Color( 1, 1, 0.88, 1 )
	elif value > 0.75 and  value <= 1:
		return Color( 0, 1, 0.5, 1 )
	pass
	
	
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
