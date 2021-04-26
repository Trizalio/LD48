extends Control

export (NodePath) var description_path;
export (NodePath) var choices_container_path;

var font = preload("res://resources/fonts/bebas-neue-font.tres");
var _description_label: RichTextLabel;
var _choices_container: VBoxContainer;

func _ready():
	_description_label = get_node(description_path);
	_choices_container = get_node(choices_container_path);
	# set_description("DESCRIPTION");
	# set_choices(["FIRST", "SECOND", "THIRD"]);

func set_description(value: String):
		_description_label.text = value;
		
func set_choices(value: Array):
	for i in range(value.size()):
		var button: Button = Button.new();
		button.flat = true;
		button.text = String(i + 1) + ". " + value[i];
		button.align = Button.ALIGN_LEFT;
		button.set("custom_fonts/font", font);
		button.connect("pressed", self, "on_choice_click", [i]);
		_choices_container.add_child(button);

func on_choice_click(index: int):
	print(index);
