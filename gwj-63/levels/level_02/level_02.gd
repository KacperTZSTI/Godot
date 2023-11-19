extends Node2D

var time  = 0


func _process(delta):
	time += delta
	if time > 150:
		Music.play_night()
