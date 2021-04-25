extends Control

func start_btn_click_handler():
	print('start');



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/ui/intro.tscn")
