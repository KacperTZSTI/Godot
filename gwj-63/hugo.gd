extends Node2D


func _on_area_2d_body_entered(body):
	if 'kotek' in body:
		body.time = -9
		for item in get_tree().get_nodes_in_group("Game over items"):
			item.visible = true
		body.get_tree().get_nodes_in_group("Game over items")[0].position.y = -100
		body.get_tree().get_nodes_in_group("Game over items")[0].text  = "Why are you here \nYou shouldn't wander at night\n Have you forgotten your way to our home?\nIt's in the stage select\n Please look for it.\n\n\n\n __g4__"

