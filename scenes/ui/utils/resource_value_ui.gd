tool
extends HBoxContainer

export var fullness: float = 0.5 setget _set_fullness
export var param_name: String = 'STUB' setget _set_param_name
export var base_style: StyleBoxFlat setget _set_base_style
export var base_font: Font setget _set_base_font
export var yellow_brightness: float = 2 setget _set_yellow_brightness
export var text_size: int = 20 setget _set_text_size
export var pill_size: int = 14 setget _set_pill_size

var front_style = null
var back_style = null

onready var param_label: Label = $left_center_container/param_label
onready var progress_bar: Control = $right_center_container/progress_bar

func _ready():
	_set_yellow_brightness(yellow_brightness)
	_set_base_style(base_style)
	_set_param_name(param_name)
	_set_fullness(fullness)
	_set_base_font(base_font)
	_set_text_size(text_size)
	_set_pill_size(pill_size)
	pass
	
func _set_text_size(new_text_size: int):
	text_size = new_text_size
	render_font()
	
func _set_pill_size(new_pill_size: int):
	pill_size = new_pill_size
	if progress_bar != null and base_style != null:
		var old_size = progress_bar.get_custom_minimum_size()
		old_size.y = pill_size
		progress_bar.set_custom_minimum_size(old_size)
#	set_style_size(filled_style)
#	set_style_size(current_style)
#	set_style_size(drained_style)
	
func _set_base_font(new_base_font: Font):
	base_font = new_base_font
	render_font()

func render_font():
#	print('render_font: ', param_label, ', ', base_font)
	if param_label != null and base_font != null:
#		print('render_font')
		var current_font = base_font.duplicate()
		current_font.set_size(text_size)
		param_label.set('custom_fonts/font', current_font)

func _set_base_style(new_base_style: StyleBoxFlat):
	base_style = new_base_style
	front_style = base_style.duplicate()
	var old_border_color = front_style.get_border_color()
	old_border_color.a = 0
	front_style.set_border_color(old_border_color)
	back_style = base_style.duplicate()
	
func set_style_color(style: StyleBoxFlat, color: Color):
	style.set_bg_color(color)
	var old_shadow = style.get_shadow_color()
	var new_shadow = Color(color.r, color.g, color.b, old_shadow.a)
	style.set_shadow_color(new_shadow)
	
#func set_style_size(style: StyleBoxFlat):
##	var old_expend_margin: Margin = style.get_expand_margin()
#	style.set_expand_margin(MARGIN_TOP, pill_size)
	

func _set_fullness(new_fullness: float):
	new_fullness = clamp(new_fullness, 0, 1)
	fullness = new_fullness
	render_state()
	
func _set_yellow_brightness(new_yellow_brightness: float):
	yellow_brightness = new_yellow_brightness
	render_state()
#	print('fullness: ', fullness)

func render_state():
	if progress_bar != null and base_style != null:
#		print('current_fullness: ', current_fullness)
		progress_bar.value = fullness
		var red: float = pow(1 - fullness, 1 / yellow_brightness)
		var green: float = pow(fullness, 1 / yellow_brightness)
		var current_color: Color = Color(red, green, 0)
		var current_color_back: Color = current_color.darkened(0.5)
		set_style_color(front_style, current_color)
		set_style_color(back_style, current_color_back)
		progress_bar.set('custom_styles/fg', front_style)
		progress_bar.set('custom_styles/bg', back_style)
	
func _set_param_name(new_param_name: String):
	param_name = new_param_name
	if param_label != null:
		param_label.text = param_name

