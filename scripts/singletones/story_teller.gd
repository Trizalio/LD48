extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var events_passed = []
func start_new_game():
	events_passed = []

class Modification:
	pass

class Answer:
	var text: String
	var effect

class Story:
	var description: String
	var answers: Array

	func _init(_name: String, _answers: Array):
		description = _name
		answers = _answers


signal notification (description, answers)

func emit_notification(description: String, answers: Array = []):
	emit_signal("notification", [description, answers])
	
func process_answer(answer):
	pass

func tell_me_a_story():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
