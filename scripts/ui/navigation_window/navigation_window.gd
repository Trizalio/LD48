extends Node2D
var star_scene = preload("res://scenes/ui/navigation_window/navigation_window_star.tscn");

const STAR_STATUS = {
	CURRENT = "#FF98FB98",
	REACHABLE = "#FFFFFFFF",
	VISITED = "#33FFFFFF"
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
	var current_star = stars[0];
	var offset;
	var random_number_generator = RandomNumberGenerator.new();
	var reachable_stars = Ship.get_reachable_stars();
	for star_data in stars:
		var star = star_scene.instance();
		star.scale = Vector2(0.2, 0.2);
		add_child(star);
		if reachable_stars.has(star_data):
			star.set_color(STAR_STATUS.REACHABLE);
		else:
			star.set_color(STAR_STATUS.VISITED)
		if star_data == current_star:
			star.set_color(STAR_STATUS.CURRENT);
			star.scale = Vector2(0.5, 0.5);
		var location = star_data.location;
		star.set_position(star_data.location * 50 + (projectResolution / 2 - current_star.location));
		random_number_generator.randomize();
		star.rotate(random_number_generator.randf_range(0, 360));
		#	for data in stars_data:
#		var star = star_scene.instance();
#		star.set_process_input(true);
#		add_child(star);
#		star.set_position(Vector2(data['x'], data['y']))
#		get_viewport().get_camera().
	
