extends Control


var fullscreen = false # wara od vara
var setup = true


func _ready():
	setup = true
	var settings = GameLoader.load_game()
	fullscreen = settings["fullscreen"]
	var nodes = get_tree().get_nodes_in_group("Settings")
	
	var node = nodes[0]
	node.button_pressed = fullscreen
	print("setting button checked")
	print("true" if fullscreen else "false")
	
	setup = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu/memu.tscn")
	

	


func save_game():
	var file = FileAccess.open("user://.gamesettings", FileAccess.WRITE)
	file.store_line("true" if fullscreen else "false")

func _on_fullscreen_toggled(pressed:bool):
	if setup:
		return;
	print("recieved button toggle")
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED if pressed else DisplayServer.WINDOW_MODE_WINDOWED)
	fullscreen = pressed
	print("fullscreen:")
	print("true" if fullscreen else "false")
	save_game()
