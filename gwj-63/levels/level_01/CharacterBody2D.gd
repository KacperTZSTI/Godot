extends CharacterBody2D

var FRICTION = 50
var ACCELERATION = 40
var MAX_SPEED = 250
var input_vector = Vector2.ZERO
var MAX_TIME = 2

var koteły = 0

@export
var time = MAX_TIME
var game = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	time = MAX_TIME;
	game = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if time<0:
		game = false
		for item in get_tree().get_nodes_in_group("Game over items"):
			item.visible = true
		get_tree().get_nodes_in_group("Game over items")[1].text  = "Collected cats: "+str(int(koteły))
	if game:
		movement(delta)
		get_tree().get_nodes_in_group("Global indicators")[0].text = "Time left: "+str(int(time))
		time -= delta
	
	

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
