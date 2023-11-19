extends Node2D

var time = 0
var VISIBLE_TIME = 150


func _on_area_2d_body_entered(body):
	if time>VISIBLE_TIME:
		if 'kotek' in body:
			body.time = -9
			for item in get_tree().get_nodes_in_group("Game over items"):
				item.visible = true
			body.get_tree().get_nodes_in_group("Game over items")[0].position.y = -100
			body.get_tree().get_nodes_in_group("Game over items")[0].text  = "Why are you here \nYou shouldn't wander at night\n Have you forgotten your way to our home?\nIt's in the stage select\n Please look for it.\n\n\n\n __g4__"

func _process(delta):
	time+= delta
	if time>VISIBLE_TIME:
		visible = true
