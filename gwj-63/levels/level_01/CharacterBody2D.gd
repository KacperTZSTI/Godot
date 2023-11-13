extends CharacterBody2D

var FRICTION = 50
var ACCELERATION = 40
var MAX_SPEED = 250
var input_vector = Vector2.ZERO
var MAX_TIME = 300

var koteły = 0
var kotek = null

var time_since_last_interaction = 0;
var code = ''

var time = MAX_TIME
var game = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	time = MAX_TIME;
	game = true;

func teleport(x,y):
	position.x = x
	position.y = y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_last_interaction += delta;
	if time_since_last_interaction > 2:
		code = ''
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("ui_down"):
		code += 'd'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("ui_up"):
		code += 'u'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("ui_left"):
		code += 'l'
		time_since_last_interaction = 0
	if Input.is_action_just_pressed("ui_right"):
		code += 'r'
		time_since_last_interaction = 0
		
	if Input.is_action_just_pressed("interact"):
		code += 'a'
		time_since_last_interaction = 0
		if kotek:
			kotek.delete()
			koteły +=1
			
	if code == 'uuddlrlra':
		# konami code, without the 'b'
		time += 999
		code = ''
	if code == 'ududa':
		# simpler code
		time = MAX_TIME
		code = ''
	if code == 'uudduudda':
		# infinite cats
		koteły = 999
		time = -1
		code = ''
	if code == 'uaaa':
		# spawn cat
		koteły += 1
		code = ''
	if code == 'uuuulra':
		# kodzik na szybkość
		MAX_SPEED *=2
		ACCELERATION *=2
		code = ''
	if code == 'ddddlra':
		# kodzik na reset szybkości
		MAX_SPEED =250
		ACCELERATION = 40
		code = ''
	
	if Input.is_action_just_pressed("ui_cancel"):
		if time>0:
			time = -1
		else:
			get_tree().change_scene_to_file("res://menu/stage_select.tscn")
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
