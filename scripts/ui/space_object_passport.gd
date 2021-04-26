extends Control

export (NodePath) var tp_label_path;
export (NodePath) var gg_label_path;
export (NodePath) var ig_label_path;
export (NodePath) var dp_label_path;

var _tp_label: Label;
var _gg_label: Label;
var _ig_label: Label;
var _dp_label: Label;
var _data: StarMap.Star;

func _ready():
	_tp_label = get_node(tp_label_path);
	_gg_label = get_node(gg_label_path);
	_ig_label = get_node(ig_label_path);
	_dp_label = get_node(dp_label_path);

func set_data(data):
	_tp_label.text = String(data.terrestrial_planets);
	_gg_label.text = String(data.gas_giants);
	_ig_label.text = String(data.ice_giants);
	_dp_label.text = String(data.dwarf_planets);
	_data = data;

func on_button_click():
	Ship.jump(_data)
	UiController.close_space_object_passport();
