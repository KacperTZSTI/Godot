extends Node2D 
# koteł :D :D :3


func _ready():
	pass


func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.koteły += 1;
	hide()
	get_tree().queue_delete(self)
	
