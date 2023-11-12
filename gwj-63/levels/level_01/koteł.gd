extends Node2D 
# koteł :D :D :3


func _ready():
	pass


func _process(delta):
	pass
	
func delete():
	hide()
	get_tree().queue_delete(self)


func _on_area_2d_body_entered(body):
	body.kotek = self
	


func _on_area_2d_body_exited(body):
	body.kotek = null
