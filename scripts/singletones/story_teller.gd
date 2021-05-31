extends Node

signal notification (description, choices)


var stories = {
	"Test": preload("res://scenes/stories/TestStory.tscn")
}

var current_story = null
var current_story_node = null

func emit_notification(description: String, answers: Array = []):
	emit_signal("notification", description, answers)
	
func process_answer(answer):
	pass

func notification_result(text, result):
	var next = (current_story_node as Node).get_child(result) 
	_process_story(next as StoryStepNode)

func tell_me_a_story(name: String):
	var storyPackedScene = stories[name] as PackedScene
	var story  = storyPackedScene.instance()
	_process_story(story.get_child(0) as StoryStepNode)

func _process_story(node: StoryStepNode):
	if len(node.redirrect_path) > 0:
		var root = _get_orphan_root(node)
		var new_node = root.get_node(node.redirrect_path)
		if new_node != null:
			node = new_node

	current_story_node = node

	var answers = []
	for child in node.get_children():
		var storyNode = child as StoryStepNode
		answers.append(storyNode.edge_description)
		
	if len(answers) == 0:
		current_story_node = null
		return

	emit_notification(node.node_description, answers)

func _get_orphan_root(node: Node):
	while true:
		var parent = node.get_parent()
		if parent == null:
			return node
		node = parent


func _ready():
	pass
