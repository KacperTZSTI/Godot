extends Node2D 
# koteł :D :D :3

@onready var anim = $AnimationPlayer

var collected = false
var collected_time = 0
var MAX_TIME = 0.5

func _ready():
	anim.play("idle")


func _process(delta):
	if collected:
		if collected_time>MAX_TIME:
			queue_free()
		collected_time += delta
	
func delete():
	collected = true
	$AudioStreamPlayer2D.play()
	anim.play("catch")
	print("collected")
	
func interact(node):
	if 'koteły' in node && collected == false:
		node.koteły += 1
		collected = true


func _on_area_2d_body_entered(body):
	if 'kotek' in body:
		body.kotek = self
	


func _on_area_2d_body_exited(body):
	if 'kotek' in body:
		body.kotek = null
