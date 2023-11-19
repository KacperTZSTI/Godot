extends "res://levels/koteł.gd"

var time = 0;
var TIME_VISIBLE = 131


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta;
	if time > TIME_VISIBLE:
		visible = true
