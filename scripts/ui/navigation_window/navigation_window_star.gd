extends Area2D

export (NodePath) var sprite_path;
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
