extends Control

func _ready():
	$"level-1".grab_focus()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://menu/memu.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu/memu.tscn")

func _on_l1_pressed():
	get_tree().change_scene_to_file("res://levels/level_01/level_01.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://levels/level_02/level_02.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://levels/level_03/level_03.tscn")
