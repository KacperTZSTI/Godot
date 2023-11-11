extends CharacterBody2D

var FRICTION = 50
var ACCELERATION = 40
var MAX_SPEED = 250
var input_vector = Vector2.ZERO
var MAX_TIME = 20
@export
var time = MAX_TIME

# Called when the node enters the scene tree for the first time.
func _ready():
	time = MAX_TIME;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	get_tree().get_nodes_in_group("Global indicators")[0].text = "Time left: "+str(int(time))
	if time<0:
		get_tree().change_scene_to_file("res://menu/stage_select.tscn")
	movement(delta)
	
	

func movement(delta):
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	move_and_slide()
