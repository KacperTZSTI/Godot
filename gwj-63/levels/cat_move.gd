extends Node2D

@onready var anim = $walk_cat/AnimationPlayer

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


func _process(delta):
	if $walk_cat.collected == true:
		anim.play("catch")
	else:
		if step == 0:
			anim.play("right")
			if $walk_cat.position.x < MAX_X:
				$walk_cat.position.x += speed * delta
			else:
				step = 1
		if step == 1:
			anim.play("down")
			if $walk_cat.position.y < MAX_Y:
				$walk_cat.position.y += speed * delta
			else:
				step = 2
		if step == 2:
			anim.play("left")
			if $walk_cat.position.x > MIN_X:
				$walk_cat.position.x -= speed * delta
			else:
				step = 3
		if step == 3:
			anim.play("up")
			if $walk_cat.position.y > MIN_Y:
				$walk_cat.position.y -= speed * delta
			else:
				step = 0


func _on_walk_cat_tree_exited():
	queue_free()

