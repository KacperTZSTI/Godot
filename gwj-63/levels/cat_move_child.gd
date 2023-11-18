extends "res://levels/koteł.gd"

func delete():
	get_parent().hide()
	get_tree().queue_delete(get_parent())
