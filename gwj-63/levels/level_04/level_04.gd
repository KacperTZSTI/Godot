extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_w()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	Music.play_menu()
	$Area2D.queue_free()
