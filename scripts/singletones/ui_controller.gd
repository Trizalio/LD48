extends Node

var passport_scene: PackedScene = preload("res://scenes/ui/space_object_passport.tscn");
var passport_scene_instance: Node;

func open_space_object_passport(data):
	if not passport_scene_instance:
		passport_scene_instance = passport_scene.instance();
	get_tree().get_root().add_child(passport_scene_instance);
	passport_scene_instance.set_data(data);

func close_space_object_passport():
	passport_scene_instance.get_parent().remove_child(passport_scene_instance);
