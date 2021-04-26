extends Area2D

export (NodePath) var sprite_path;
export (PackedScene) var passport_scene;
var _data: StarMap.Star;
var _is_available: bool;

#func _input_event(viewport, event, shape_idx):
#	print(viewport, event, shape_idx);
#	print('click');
var sprite: Sprite;
var color: String;

func _ready():
	sprite = get_node(sprite_path);
	var numb = randi()%10+1
	$AnimationPlayer.seek(numb, false)

func set_color(value):
	sprite.self_modulate = Color(value);
#	sprite.self_modulate = Color(value);

func set_data(data):
	_data = data;

func set_avaliability(value):
	_is_available = value;

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and _is_available:
		UiController.open_space_object_passport(_data);
