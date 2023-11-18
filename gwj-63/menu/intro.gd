extends Node2D


func _ready():
	Music.play_menu()



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://menu/memu.tscn")
