extends Area2D

#export (float) var rotation_speed = 1.5
#var direction = Vector2(1,0)
#var screenWidth = ProjectSettings.get_setting("display/window/size/width")
#var velocity = Vector2()
#var rotation_dir = 0
func _ready():
	pass
#	print(" wrtf")
var preload_sprite = preload("res://scenes/celestial_body.tscn")
var animate_sprite: AnimatedSprite = preload_sprite.instance()
#export (String) var on_click_evevnt = "Click321"
signal clicked
func init_clicable(animation: String, frame:int):
#	print(" wrtfffasdasdasdasdasdasdasd e e e e e e e e e")
#	var animate_sprite = AnimatedSprite.new()
#	sprite.texture = load(path_to_image) # could use preload
#	var animate_sprite: AnimatedSprite = preload_sprite.instance()
#	print(animate_sprite.get_sprite_frames().get_frame_count(animation))
	animate_sprite.set_animation(animation)
	animate_sprite.set_frame(frame)
#	sprite.position = Vector2(x, y)
	self.add_child(animate_sprite)
	var rectangle_shape = RectangleShape2D.new()
	rectangle_shape.extents = Vector2(32, 32)
#	rectangle_shape.position = Vector2(_radius, 0)
	var collision_shape = CollisionShape2D.new()
	collision_shape.shape = rectangle_shape
#	collision_shape.position = Vector2(x, y)
	self.add_child(collision_shape)
#	self.position = Vector2(x, y)
#	on_click_evevnt = on_click_ivevnt
#	print(on_click_evevnt)
#	var clickable = load("res://scripts/


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("got clicked  123123123")
		emit_signal("clicked")
#		self.on_click()

#func on_click():
	
#	print(on_click_evevnt)
#	emit event

#func _process(delta):
#	position += direction
##	rotation += rotation_dir * rotation_speed * delta
#	if position.x >= screenWidth or position.x <= 0:
#		direction = -(direction)


#func _physics_process(delta):
#    rotation += rotation_dir * rotation_speed * delta
#    velocity = move_and_slide(velocity)
#func _ready():
#    var sprite = Sprite.new()
#    sprite.texture = load("res://icon.png") # could use preload
#    self.add_child(sprite)
#    var rectangle_shape = RectangleShape2D.new()
#    rectangle_shape.extents = Vector2(32, 32)
#    var collision_shape = CollisionShape2D.new()
#    collision_shape.shape = rectangle_shape
#    self.add_child(collision_shape)
