class_name StoryStepNode
extends Node

export(String) var node_description = "Some event happened"
export(String) var edge_description = ""
export(Resource) var visitation_cost = ShipResources.new()
export(Resource) var visitation_requirments = ShipResources.new()
export(String) var redirrect_path = ""

func _ready():
	pass # Replace with function body.
