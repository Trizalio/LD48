extends Node



func animate(object: Object, property: NodePath, final_value, duration, trans_type, ease_type, destroy=false):
	var tween = Tween.new()
	self.add_child(tween)
	tween.connect("tween_completed", self, '_tween_callback', [tween, destroy])
	var start_value = object.get(property)
	tween.interpolate_property(object, property, start_value, final_value, duration, trans_type, ease_type)
	tween.start()
	print('started')
	
func _tween_callback(object: Node, property, tween: Tween, destroy: bool):
	if destroy:
		object.get_parent().remove_child(object)
	self.remove_child(tween)
	print('done')

func remove_with_delay(object: Object, delay: float):
	var tween = Tween.new()
	self.add_child(tween)
	tween.interpolate_callback(self, delay, 'remove', tween)
	tween.start()
	print('call with delay')
	
func remove(object: Node, tween: Tween):
	object.get_parent().remove_child(object)
	self.remove_child(tween)
	print('called')
	
