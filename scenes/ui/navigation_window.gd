extends Node2D
var star_map = preload("res://scripts/singletones/star_map.gd");
var star_scene = preload("res://scenes/ui/navigation_window_star.tscn");

var stars_data = [
	{ 'x': 10, 'y': 10},
	{ 'x': 50, 'y': 20},
	{ 'x': 80, 'y': 30},
	{ 'x': 120, 'y': 40},
	{ 'x': 440, 'y': 50},
	{ 'x': 500, 'y': 60},
	{ 'x': 600, 'y': 70},
	{ 'x': 700, 'y': 80},
	{ 'x': 800, 'y': 90},
	{ 'x': 900, 'y': 100},
	{ 'x': 1000, 'y': 110},
	{ 'x': 1100, 'y': 120},
	{ 'x': 1200, 'y': 130},
	{ 'x': 1300, 'y': 140},
	{ 'x': 1400, 'y': 150},
	{ 'x': 1700, 'y': 160},
	{ 'x': 1850, 'y': 170},
	{ 'x': 2000, 'y': 180},
	{ 'x': 2100, 'y': 190},
	{ 'x': 2250, 'y': 200},	
];

func _ready():
	print(star_map);
	var stars = star_map.get_stars();
	print(stars);
	for star_data in stars:
		var star = star_scene.instance();
#	for data in stars_data:
#		var star = star_scene.instance();
#		star.set_process_input(true);
#		add_child(star);
#		star.set_position(Vector2(data['x'], data['y']))
#		get_viewport().get_camera().
	
