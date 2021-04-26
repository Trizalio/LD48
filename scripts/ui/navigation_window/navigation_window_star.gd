extends Area2D

export (NodePath) var sprite_path;
export (PackedScene) var passport_scene;
var _data: StarMap.Star;
#func _input_event(viewport, event, shape_idx):
#	print(viewport, event, shape_idx);
#	print('click');
var sprite: Sprite;
var color: String;

func _ready():
	sprite = get_node(sprite_path);

func set_color(value):
	sprite.self_modulate = Color(value);
#	sprite.self_modulate = Color(value);

func set_data(data):
	_data = data;

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		UiController.open_space_object_passport(_data);
