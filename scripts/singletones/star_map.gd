extends Node

func _ready():
	pass
	
func get_max_range():
	return 5

func get_scale():
	return 50

class PlanetType:
	const terrestrial_planet: String = "Terrestrial planet"
	const gas_giant: String = "Gas giant"
	const ice_giant: String = "Ice giant"
	const dwarf_planet: String = "Dwarf planet"

class Planet:
	var range_from_star: float
	var name_: String
	var type_name: String # PlanetType
	var frame_seed: int
	var gravity: float = -1
	var temperature: float = -1
	var water: float = -1
	var atmosphere: float = -1
	var resources: float = -1
	var life: float = -1

	func _init(_name: String, _range_from_star: float, _type_name: String):
		name_ = _name
		range_from_star = _range_from_star
		type_name = _type_name
		frame_seed = randi()


class Star:
	var name_: String
	var location: Vector2
	var frame_seed: int
	var terrestrial_planets: int = -1
	var gas_giants: int = -1
	var ice_giants: int = -1
	var dwarf_planets: int = -1
	
	func _init(_name: String, _location: Vector2):
		name_ = _name
		location = _location
		frame_seed = randi()
		
class SystemStar:
	var name_: String
	var frame_seed: int

	func _init(_name: String, _frame_seed: int):
		name_ = _name
		frame_seed = _frame_seed
		
class StarSystem:
	var star: SystemStar
	var planets: Array
	
	func _init(_star: SystemStar, _planets: Array):
		star = _star
		planets = _planets

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
				var new_star = Star.new("S-" +str(i)+str(j), Vector2(i, j) + shift)
				cell_location_to_star[location] = new_star
			else:
#				print("present", i, j)
				pass

func generate_new_map():
	print('StarMap.generate_new_map start')
	cell_location_to_star = {}
	var first_star = Star.new("S-00", Vector2(0, 0))
	cell_location_to_star[Vector2(0, 0)] = first_star
	generate_stars_around_star(first_star)
	return first_star

func discover_star(star: Star):
	star.terrestrial_planets = 1
	star.gas_giants = 1
	star.ice_giants = 1
	star.dwarf_planets = 1

var range_step = 100
var range_deviation = 0.3 * range_step
var _start_to_star_system: Dictionary = {}
func get_star_system_info(star: Star) -> StarSystem:
	if not _start_to_star_system.has(star):
		
		discover_star(star)
		var system_star = SystemStar.new(star.name_, star.frame_seed)
		var planets: Array = []
		var last_range: float = 0
		for i in range(star.terrestrial_planets):
			var name = "terrestrial_planet-" + str(star.frame_seed)
			var planet_range = (len(planets) + 1) * range_step + rand_range(-range_deviation, range_deviation)
			var planet = Planet.new(name, planet_range, PlanetType.terrestrial_planet)
			print('planet: ', planet)
			planets.append(planet)
		for i in range(star.gas_giants):
			var name = "gas_giant-" + str(star.frame_seed)
			var planet_range = (len(planets) + 1) * range_step + rand_range(-range_deviation, range_deviation)
			var planet = Planet.new(name, planet_range, PlanetType.gas_giant)
			print('planet: ', planet)
			planets.append(planet)
#		star.discover()
		print('planets: ', planets)
		var star_system = StarSystem.new(system_star, planets)
		print('star_system: ', star_system)
		_start_to_star_system[star] = star_system
	return _start_to_star_system[star]
