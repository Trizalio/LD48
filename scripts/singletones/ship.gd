extends Node


var engine: float = 1
var defence: float = 1
var power: float = 1
var support: float = 1
var ai: float = 1

var fuel: float = 1
var energy: float = 1
var people: float = 1
var info: float = 1
##
#var front_hull: float = 1
#var side_hull: float = 1
#var sleep_chambers: float = 1
#var fuel_tank: float = 1
#var power_cell: float = 1
#var probe_launcher: float = 1
#var solar_panels: float = 1
#var generator: float = 1
#var extractor: float = 1
#var jet_engine: float = 1
#var ftl_engine: float = 1
#var mainframe: float = 1
#var data_base: float = 1
#var construction_facility: float = 1
#
#var fuel: float = 1
#var energy: float = 1
#var materials: float = 1

var current_star = null
var visited_stars = []

signal move_ship_to (planet)
signal state_changed 
signal notification (description, choices)

func update_state(delta_engine: float, delta_defence: float, delta_fuel: float):
	print('update_state: ', delta_engine, ', ', delta_defence, ', ', delta_fuel)
	engine += delta_engine
	defence += delta_defence
	fuel += delta_fuel
	emit_signal("state_changed")

func new_game():
	print('Ship.new_game start')
	engine = 1
	defence = 1
	power = 1
	support = 1
	ai = 1
	
	fuel = 1
	energy = 1
	people = 1
	info = 1
##
#	front_hull = 1
#	side_hull = 1
#	sleep_chambers = 1
#	fuel_tank = 1
#	power_cell = 1
#	probe_launcher = 1
#	solar_panels = 1
#	generator = 1
#	extractor = 1
#	jet_engine = 1
#	ftl_engine = 1
#	mainframe = 1
#	data_base = 1
#	construction_facility = 1
#
#	fuel = 1
#	energy = 1
#	materials = 1
	
	var first_star = StarMap.generate_new_map()
	current_star = first_star
	visited_stars = []
#	StarMap.get_star_system_info(current_star)

#var tex = preload("res://icon.png")

#func render_stars():
#	for sprite in sprite_to_star:
#		remove_child(sprite)
#	sprite_to_star = {}
#	var projectResolution = get_viewport().size
#	var all_stars: Array = StarMap.get_stars()
#	var reachable_stars: Array = get_reachable_stars()
#	for star in all_stars:
#
#		var sprite = Sprite.new()
#		sprite_to_star[sprite] = star
#		var scale = Vector2(0.1, 0.1)
#		if reachable_stars.has(star):
#			scale *= 2
#		if star == current_star:
#			scale *= 2
#		sprite.scale = scale
#		sprite.position = star.location * 50 + projectResolution / 2
#		sprite.set_texture(tex)
#		add_child(sprite)

func _ready():
	new_game()
#	render_stars()

#var sprite_to_star = {}
#
#func _input(event):
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
#		print(event.global_position)
#		for sprite in sprite_to_star:
#			var delta = event.global_position - sprite.position
#			if delta.length() < 10:
#				if sprite.scale.x > 0.15 and sprite.scale.x < 0.25:
#					jump(sprite_to_star[sprite])
#					render_stars()
var actions = []
func get_actions() -> Array:
	print('get_actions')
#	actions.append('jump' + str(len(actions)))
#	return ['Jump', 'Recicle colonists', 'scan stars', 'scan planet', "colonise"]
	actions = ['jump', '#REMOVE_ME']
	actions.append('update_state')
	if current_object != null:
		actions.append('scan planet')
		actions.append('colonise')
	return actions

var star_map_class = preload('res://scenes/ui/event_window.tscn') 


var colonisation_text = (
	"After years of wandering through space, you and your people are exhausted.\n"
	+ "A thought comes to your mind. Perhaps here you will find a new home.\n"
	+ "A place you were dreaming about. A breath of fresh air. Serenity.\n"
	+ "Are you sure you want to colonize this planet?"
)
func do_action(action: String, source=null):
	print('do_action: ', action, ' by: ', source)
	if action == 'jump':
		SceneChanger.goto_scene('res://scenes/ui/navigation_window/navigation_window.tscn')
#	if action == 'notification':
#		emit_signal("notification", "test", ["1", "2", "3"])
		
	if action == 'scan planet':
		if current_object != null:
			current_object.scan()
			emit_signal("notification", "Scan complete", ["ok"])
		
	if action == 'colonise':
		if current_object != null:
			emit_signal("notification", 
			colonisation_text, ["Yes", "No"])
			
	if action == '#REMOVE_ME':
		StoryTeller.tell_me_a_story("Test")
		
	if action == 'update_state':
		update_state(-0.11, -0.17, -0.13)
#		SceneChanger.current_scene.get_node('CanvasLayer').add_child(star_map_class.instance())

var current_object = null
func move_ship_to(planet_info):
	print('Ship.move_ship_to', planet_info.type_name)
	current_object = planet_info
	emit_signal("move_ship_to", planet_info)

func finish_game(planet_info):
	var success_points = 0;
	success_points += planet_info.gravity;
	success_points += planet_info.temperature;
	success_points += planet_info.water;
	success_points += planet_info.atmosphere;
	
	var success_result = success_points / 4;
	
	SceneChanger.goto_scene('res://scenes/ui/final_scene.tscn');
	yield(SceneChanger, "scene_changed");
	var root = SceneChanger.current_scene;
	if (success_result < 0.2):
		root._on_TextureButton1_pressed(); #bad
	elif (success_result < 0.4):
		root._on_TextureButton2_pressed(); #bad
	elif (success_result < 0.6):
		root._on_TextureButton3_pressed(); #bad
	elif (success_result < 0.8):
		root._on_TextureButton5_pressed(); #50/50
	elif (success_result <= 1):
		root._on_TextureButton7_pressed(); #good

func get_star_path():
	return visited_stars
	
func get_jump_range():
	return 2.5
	
func get_reachable_stars():
	var all_stars = StarMap.get_stars()
	var reachable_stars = []
	for star in all_stars:
		var delta_location: Vector2 = star.location - current_star.location
		if delta_location.length() <= get_jump_range() and delta_location.x >= abs(delta_location.y):
			reachable_stars.append(star)
	return reachable_stars
	
func jump(destination_star):
	visited_stars.append(current_star)
	current_star = destination_star
	StarMap.move_to_star(destination_star)
	SceneChanger.goto_scene('res://scenes/ui/main_scene.tscn')
	
func get_current_star():
	return current_star

func notification_result(text, result):
	print('notification_result: ', text, " result:", result)
	if text == colonisation_text and result == 0:
		finish_game(current_object)
