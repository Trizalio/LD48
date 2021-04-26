extends Node2D


func _on_TextureButton1_pressed():
	$Sucsessful_0.visible = true
	$Panel4.visible = true
	$Panel4/TextEdit.visible = true
	$AIColonystsDead.play()

func _on_TextureButton2_pressed():
	$Sucsessful20.visible = true
	$Panel5.visible = true
	$Panel5/TextEdit.visible = true
	$BadEnd50.play()

func _on_TextureButton3_pressed():
	$Sucsessful50.visible = true
	$Panel6.visible = true
	$Panel6/TextEdit.visible = true
	$BadEnd50.play()

func _on_TextureButton4_pressed():
	$Sucsessful51_village.visible = true
	$Panel7.visible = true
	$Panel7/TextEdit.visible = true
	$fiftyfiftyend.play()

func _on_TextureButton5_pressed():
	$Sucsessful60.visible = true
	$Panel8.visible = true
	$Panel8/TextEdit.visible = true
	$fiftyfiftyend.play()


func _on_TextureButton6_pressed():
	$AI_human.visible = true
	$Panel9.visible = true
	$Panel9/TextEdit.visible = true
	$GoodEnd.play()

func _on_TextureButton7_pressed():
	$Great_Human.visible = true
	$Panel10.visible = true
	$Panel10/TextEdit.visible = true
	$GoodEnd.play()

func _on_TextureButton8_pressed():
	$dead_AI.visible = true
	$Panel11.visible = true
	$Panel11/TextEdit.visible = true
	$AIColonystsDead.play()

func _on_TextureButton9_pressed():
	$dead_AIself.visible = true
	$Panel12.visible = true
	$Panel12/TextEdit.visible = true
	$BadEnd50.play()

func _on_TextureButton10_pressed():
	$AIgreat.visible = true
	$Panel13.visible = true
	$Panel13/TextEdit.visible = true
	$AI_human2.play()

func reset_game():
	SceneChanger.goto_scene("res://scenes/ui/intro.tscn");
