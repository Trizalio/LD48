extends Node2D

signal action_clicked

var container_class = preload("res://scenes/ui/CircularContainer.gd")
var menu = null
var closing_in_progress = false

var actions = null
var duration = null
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
		menu.add_child(button)
		
#	print('min:', menu.get_minimum_size())
#	menu.set_force_squares(true)
#	menu.set_start_angle_deg(0)
	menu.set_display_all_at_once(true)
	menu.set_percent_visible(0)
	menu.set_position(position - menu.get_minimum_size() / 2)
	Animator.animate(menu, 'animate/percent_visible', 1, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Animator.animate(menu, 'arrange/start_angle', 360, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	add_child(menu)
