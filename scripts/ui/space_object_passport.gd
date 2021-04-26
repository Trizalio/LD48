extends Control

export (NodePath) var tp_label_path;
export (NodePath) var gg_label_path;
export (NodePath) var ig_label_path;
export (NodePath) var dp_label_path;
export (NodePath) var cb_path;

var _tp_label: Label;
var _gg_label: Label;
var _ig_label: Label;
var _dp_label: Label;
var _cb_instance: AnimatedSprite;
var _data: StarMap.Star;

func _ready():
	_tp_label = get_node(tp_label_path);
	_gg_label = get_node(gg_label_path);
	_ig_label = get_node(ig_label_path);
	_dp_label = get_node(dp_label_path);
	_cb_instance = get_node(cb_path);
	_cb_instance.set_animation('star');

func set_data(data):
	_tp_label.text = String(filter_count(data.terrestrial_planets));
	_gg_label.text = String(filter_count(data.gas_giants));
	_ig_label.text = String(filter_count(data.ice_giants));
	_dp_label.text = String(filter_count(data.dwarf_planets));
	var frames_count = _cb_instance.get_sprite_frames().get_frame_count('star');
	_data = data;
	_cb_instance.set_frame(data.frame_seed % frames_count);

func filter_count(count):
	if count >= 0:
		return count;
	else:
		return 'Unknown';

func on_button_click():
	Ship.jump(_data)
	UiController.close_space_object_passport();

func on_close_button_click():
	UiController.close_space_object_passport();
