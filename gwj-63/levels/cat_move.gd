extends Node2D

var step = 0
var MIN_X = 0
var MIN_Y = 0
var MAX_X = 0
var MAX_Y = 0

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	MIN_X = $left_top.position.x
	MIN_Y = $left_top.position.y
	MAX_X = $bottom_right.position.x
	MAX_Y = $bottom_right.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if step == 0:
		if $moving_cat.position.x < MAX_X:
			$moving_cat.position.x += speed * delta
		else:
			step = 1
	if step == 1:
		if $moving_cat.position.y < MAX_Y:
			$moving_cat.position.y += speed * delta
		else:
			step = 2
	if step == 2:
		if $moving_cat.position.x > MIN_X:
			$moving_cat.position.x -= speed * delta
		else:
			step = 3
	if step == 3:
		if $moving_cat.position.y > MIN_Y:
			$moving_cat.position.y -= speed * delta
		else:
			step = 0
