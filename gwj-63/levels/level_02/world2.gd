extends Node2D

var time  = 0

func _ready():
	Music.play_park()

func _process(delta):
	time += delta
	if time > 151:
		Music.play_night()
