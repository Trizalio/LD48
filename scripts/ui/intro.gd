extends Control
export (Array, Resource) var steps = []
export (NodePath) var texture_rect_path;
export (NodePath) var text_label_path;
export (NodePath) var button_path;
#
#var current_index = 0;
#var texture_rect: TextureRect;
#var text_label: RichTextLabel;
#var button: Button;
#
#func _ready():
#	texture_rect = get_node(texture_rect_path);
#	text_label = get_node(text_label_path);
#	button = get_node(button_path);
#	advance();
#
#func advance():
#	if (current_index == steps.size()):
#		finish();
#		return;
#	var step = steps[current_index];
#	texture_rect.texture = step.texture;
#	text_label.text = step.text;
#	current_index += 1;
#
#func finish():
#	button.text = 'Play';
#	print('finish')


func _on_TextureButton_pressed():
	$Sprite1.visible = false
	$Panel1.visible = false
	$Sprite2.visible = true
	$Panel2.visible = true
	$Panel2/TextEdit.visible = true
	$Panel2/TextureButton2.visible = true
	

	 # Replace with function body.


func _on_TextureButton2_pressed():
	$Sprite2.visible = false
	$Panel2.visible = false
	$Sprite3.visible = true
	$Panel3.visible = true
	$Panel3/TextEdit.visible = true
	$Panel3/TextureButton3.visible = true
	



func _on_TextureButton3_pressed():
	
