extends Node2D
var star_scene = preload("res://scenes/ui/navigation_window/navigation_window_star.tscn");

const STAR_STATUS = {
	CURRENT = "#FF98FB98",
	REACHABLE = "#FFFFFFFF",
	VISITED = "#BBBBBBBB"
}

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
	var stars = StarMap.get_stars();
	var projectResolution = get_viewport().size;
	var star_scale = StarMap.get_scale();
	var current_star = Ship.get_current_star()
	var offset = (projectResolution / 2 - current_star.location * star_scale);
	var random_number_generator = RandomNumberGenerator.new();
	var reachable_stars = Ship.get_reachable_stars();
	var map_scale = StarMap.get_scale()
	for star_data in stars:
		var range_from_current_start = star_data.location.distance_to(current_star.location);
		if range_from_current_start > StarMap.get_max_range():
			continue
		var star = star_scene.instance();
		star.scale = Vector2(0.3, 0.3);
		add_child(star);
		star.set_data(star_data);
		
		if reachable_stars.has(star_data):
			star.set_color(STAR_STATUS.REACHABLE);
			star.set_avaliability(true);
			star.scale = Vector2(0.4, 0.4);
		else:
			star.set_color(STAR_STATUS.VISITED)
		if star_data == current_star:
			star.set_color(STAR_STATUS.CURRENT);
			star.scale = Vector2(0.6, 0.6);
		var location = star_data.location;
		star.set_position(star_data.location * map_scale + offset);
		random_number_generator.randomize();
		star.rotate(random_number_generator.randf_range(0, 360));
		#	for data in stars_data:
#		var star = star_scene.instance();
#		star.set_process_input(true);
#		add_child(star);
#		star.set_position(Vector2(data['x'], data['y']))
#		get_viewport().get_camera().
	
