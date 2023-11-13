extends Sprite2D

@onready var anim = $look_anim

func _ready():
	anim.play("anim")

