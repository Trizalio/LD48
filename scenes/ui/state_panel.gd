extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var engine = $margin/value_groups/modules/engine
onready var defence = $margin/value_groups/modules/defence
onready var power = $margin/value_groups/modules/power
onready var support = $margin/value_groups/modules/support
onready var ai = $margin/value_groups/modules/ai


onready var fuel = $margin/value_groups/resources/fuel
onready var energy = $margin/value_groups/resources/energy
onready var people = $margin/value_groups/resources/people
onready var info = $margin/value_groups/resources/info

# Called when the node enters the scene tree for the first time.
func _ready():
	Ship.connect("state_changed", self, "_update")
	pass # Replace with function body.

func _update():
	engine.fullness = Ship.engine
	defence.fullness = Ship.defence
	fuel.fullness = Ship.fuel
	print('_update')
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
