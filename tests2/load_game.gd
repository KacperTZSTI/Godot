extends Object

class_name GameLoader

static func load_game():
	var fullscreen = false;
	if not FileAccess.file_exists("user://.gamesettings"):
		fullscreen = false
	else:
		var file = FileAccess.open("user://.gamesettings", FileAccess.READ)
		var _fullscreen = file.get_line()
		fullscreen = _fullscreen == "true"
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED)

	
	
	print("Loaded settings from file")
	print("fullscreen:")
	print("true" if fullscreen else "false")
	return {
		"fullscreen": fullscreen
	}
