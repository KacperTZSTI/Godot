extends Label

var time = 0
var MAX_Y = 10
var freq = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	position.y = MAX_Y * sin(time * freq)
