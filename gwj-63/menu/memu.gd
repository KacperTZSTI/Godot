extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()
	var settings = GameLoader.load_game()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://menu/stage_select.tscn")


func _on_opt_pressed():
	
	get_tree().change_scene_to_file("res://menu/opt.tscn")


func _on_quit_pressed():
	get_tree().quit()

