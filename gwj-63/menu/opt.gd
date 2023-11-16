extends Node2D

func _ready():
	$Control/CheckButton.grab_focus()
	var settings = GameLoader.load_game()
