extends Node2D
@export var dest : Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if 'teleport' in body:
		print(dest.position)
		body.position = dest.get_global_position()
		print(body.position)
