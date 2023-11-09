extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://stage_select.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")


func _on_quit_pressed():
	get_tree().quit()
