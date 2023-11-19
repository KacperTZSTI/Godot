extends Node2D

var time  = 0


func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://menu/memu.tscn")
	time += delta
	if time > 20:
		$Sprite2D2.visible = false




