extends Sprite2D


func delete():
	hide()
	get_tree().queue_delete(self)
	
func interact(node):
	if 'has_key' in node:
		node.has_key = true


func _on_area_2d_body_entered(body):
	if 'kotek' in body:
		body.kotek = self
	


func _on_area_2d_body_exited(body):
	if 'kotek' in body:
		body.kotek = null
