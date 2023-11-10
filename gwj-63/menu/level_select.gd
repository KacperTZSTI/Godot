extends Control


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://menu/memu.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu/memu.tscn")

func _on_l1_pressed():
	get_tree().change_scene_to_file("res://levels/level_01/level_01.tscn")
