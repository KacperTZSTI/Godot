extends Control

var time_since_last_interaction = 0;
var code = ''

func _ready():
	$"level-1".grab_focus()

func _process(delta):
	time_since_last_interaction += delta;
	if time_since_last_interaction > 2:
		code = ''
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("c"):
		code += 'c'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("v"):
		code += 'v'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("4"):
		code += '4'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("3"):
		code += '3'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("1"):
		code += '1'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("g"):
		code += 'g'
		time_since_last_interaction = 0
	if code == '1vg43c':
		code = ''
		$'level-4'.visible = true
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


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://levels/level_04/level_04.tscn")
