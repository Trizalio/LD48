tool
extends HBoxContainer

export var fullness: float = 1.0 setget _set_fullness
export var param_name: String = 'STUB' setget _set_param_name
export var base_style: StyleBoxFlat setget _set_base_style
export var yellow_brightness: float = 3 setget _set_yellow_brightness

var filled_style = null
var current_style = null
var drained_style = null

onready var param_label: Label = $left_center_container/param_label
onready var parts_container: Control = $right_center_container/parts_container

func _ready():
	_set_yellow_brightness(yellow_brightness)
	_set_base_style(base_style)
	_set_param_name(param_name)
	_set_fullness(fullness)
	pass

func _set_base_style(new_base_style: StyleBoxFlat):
	base_style = new_base_style
	filled_style = base_style.duplicate()
	current_style = base_style.duplicate()
	drained_style = base_style.duplicate()
	
#	var filled_color: Color = Color(0, 1, 0)
	set_style_color(filled_style, Color(0, 1, 0))
#	filled_style.set_bg_color(filled_color)
#	drained_style.set_shadow_color(filled_color)
	
#	var drained_color: Color = Color(1, 0, 0)
	set_style_color(drained_style, Color(1, 0, 0))
#	drained_style.set_bg_color(drained_color)
#	drained_style.set_shadow_color(drained_color)
	
func set_style_color(style: StyleBoxFlat, color: Color):
	style.set_bg_color(color)
	var old_shadow = style.get_shadow_color()
	var new_shadow = Color(color.r, color.g, color.b, old_shadow.a)
	style.set_shadow_color(new_shadow)
	

func _set_fullness(new_fullness: float):
	fullness = new_fullness
	render_state()
	
func _set_yellow_brightness(new_yellow_brightness: float):
	yellow_brightness = new_yellow_brightness
	render_state()
#	print('fullness: ', fullness)

func render_state():
	if parts_container != null and base_style != null:
		var parts = parts_container.get_children()
		var part_size: float = 1.0 / len(parts)
		var current_part_index: int = fullness / part_size
		var current_fullness: float = fullness / part_size - current_part_index
		print('current_fullness: ', current_fullness)
		var red: float = pow(1 - current_fullness, 1 / yellow_brightness)
		var green: float = pow(current_fullness, 1 / yellow_brightness)
		var current_color: Color = Color(red, green, 0)
		set_style_color(current_style, current_color)
#		current_style.set_bg_color(current_color)
#		current_style.set_shadow_color(current_color)
#		print('len(parts): ', len(parts))
#		print('current_part_index: ', current_part_index)
		for i in len(parts):
			var part: ProgressBar = parts[i]
			if i < current_part_index:
				part.set('custom_styles/bg', filled_style)
			elif i == current_part_index:
				part.set('custom_styles/bg', current_style)
			else:
				part.set('custom_styles/bg', drained_style)
	

func _set_param_name(new_param_name: String):
	param_name = new_param_name
	if param_label != null:
		param_label.text = param_name
	

