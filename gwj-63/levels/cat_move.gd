extends "res://levels/level_01/koteł.gd"

var step = 0
var MIN_X = -308
var MIN_Y = -399
var MAX_X = -209
var MAX_Y = -299

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if step == 0:
		if position.x < MAX_X:
			position.x += speed * delta
		else:
			step = 1
	if step == 1:
		if position.y < MAX_Y:
			position.y += speed * delta
		else:
			step = 2
	if step == 2:
		if position.x > MIN_X:
			position.x -= speed * delta
		else:
			step = 3
	if step == 3:
		if position.y > MIN_Y:
			position.y -= speed * delta
		else:
			step = 0
