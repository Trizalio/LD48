extends Node

func _ready():
	pass
	
func get_max_range():
	return 5

class Star:
	var location: Vector2
	var sprite: String = "default"
	func _init(_location: Vector2):
		location = _location

var cell_location_to_star: Dictionary = {}

func get_stars():
	return cell_location_to_star.values()
	
func move_to_star(star: Star):
	generate_stars_around_star(star)
	
func generate_stars_around_star(star: Star):
	print('StarMap.generate_stars_around_star start')
	var max_range: float = get_max_range()
	var cell_size: float = 1.0
	var deviation: float = cell_size * 0.8 / 2
	
	for i in range(star.location.x - max_range, star.location.x + max_range):
		for j in range(star.location.y - max_range, star.location.y + max_range):
			var location = Vector2(i, j)
#			print(location)
			if not cell_location_to_star.has(location):
#				print('missing')
				var shift = Vector2(rand_range(-deviation, deviation), rand_range(-deviation, deviation))
#				print('missing; shift: ', shift)
				var new_star = Star.new(Vector2(i, j) + shift)
				cell_location_to_star[location] = new_star
			else:
#				print("present", i, j)
				pass

func generate_new_map():
	print('StarMap.generate_new_map start')
	cell_location_to_star = {}
	var first_star = Star.new(Vector2(0, 0))
	cell_location_to_star[Vector2(0, 0)] = first_star
	generate_stars_around_star(first_star)
	return first_star
