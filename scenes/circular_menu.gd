extends Node2D

signal action_clicked (value)

var container_class = preload("res://scenes/ui/CircularContainer.gd")
#var clickable_ = load("res://scenes/ui/utils/clicable.tscn")
var menu = null
var closing_in_progress = false

var actions = null
var duration = null
#var is_planet = false
func init(_actions: Array, _duration: float):
	actions = _actions
	duration = _duration

func close_menu():
	if menu == null:
		print('attempt to close menu, but menu is not yet initialized')
		return
	if closing_in_progress:
		print('attempt to close menu, but menu is already closing')
		return
	print('close menu')
	closing_in_progress = true
	Animator.animate(menu, 'animate/percent_visible', 0, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Animator.animate(menu, 'arrange/start_angle', 0, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Animator.remove_with_delay(self, duration)

func _ready():
	menu = container_class.new()

	for action in actions:
		var button = Button.new()
		button.text = action
		# reemit button pressed as new action_clicked signal
#		var clickable_inst = clickable_.instance()
#		clickable_inst.init_clicable("", 0, false)
#		clickable_inst.add_child(button)
		button.connect("pressed", self, "is_presed", [action])

		menu.add_child(button)
#		menu.add_child(clickable_inst)
		

#	print('min:', menu.get_minimum_size())
#	menu.set_force_squares(true)
#	menu.set_start_angle_deg(0)
	menu.set_display_all_at_once(true)
	menu.set_percent_visible(0)
	menu.set_position(position - menu.get_minimum_size() / 2)
	Animator.animate(menu, 'animate/percent_visible', 1, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Animator.animate(menu, 'arrange/start_angle', 360, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	add_child(menu)



func is_presed(action):
	emit_signal("action_clicked", action)
	print("im pressed", action)
#func _input(event):
#	if event is InputEventMouseButton \
#	and event.button_index == BUTTON_LEFT \
#	and event.is_pressed() :
#		var a = get_viewport().get_mouse_position()
#		var menu_childrens = menu.get_children()
#		for children in menu_childrens:
#			if children is Button:
#				print(children.is)
#				print(123123123123123)
#			print(event.get_indexed())
#
#		print("31313131313")
#		print(get_viewport().get_mouse_position())
#		print("got clicked  AAAAAAAAAAAAAAAAAAAAAAAA")
#func _input_event(viewport, event, shape_idx):
#	print("22222222222222222222222222222222222222222")
#	if event is InputEventMouseButton \
#	and event.button_index == BUTTON_LEFT \
#	and event.is_pressed():
#		print("111111111111111111111111111111111111111111111")
