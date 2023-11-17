extends Sprite2D


func delete():
	hide()
	get_tree().queue_delete(self)
	


func _on_area_2d_body_entered(body):
	if 'current_key' in body:
		body.current_key = self
	
func _on_area_2d_body_exited(body):
	if 'current_key' in body:
		body.current_key = null
