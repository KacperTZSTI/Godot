extends Node2D 
# koteł :D :D :3

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("idle")


func _process(delta):
	pass
	
func delete():
	hide()
	get_tree().queue_delete(self)
	
func interact(node):
	if 'koteły' in node:
		node.koteły += 1


func _on_area_2d_body_entered(body):
	if 'kotek' in body:
		body.kotek = self
	


func _on_area_2d_body_exited(body):
	if 'kotek' in body:
		body.kotek = null
