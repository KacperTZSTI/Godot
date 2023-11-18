extends CharacterBody2D

@onready var animation : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_state = animation.get("parameters/playback")

var FRICTION = 50
var ACCELERATION = 40
var MAX_SPEED = 250
var input_vector = Vector2.ZERO
var MAX_TIME = 120

var koteły = 0
var MAX_CATS = 5
var kotek = null
var has_key = false
var current_key = null # i don't quite know how i did this, so please dont touch it

var time_since_last_interaction = 0;
var code = ''

var time = MAX_TIME
var game = true;
var scene = null

var sound = preload("res://sounds/step.mp3")
var vt = 0;
var sound_freq = 0.4

func _ready():
	scene = preload("res://levels/koteł.tscn")
	animation.active = true
	time = MAX_TIME;
	game = true;

func teleport(x,y):
	
	position.x = x
	position.y = y

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
			kotek.interact(self)
		if current_key and has_key:
			current_key.delete()
			has_key = false
			
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
		
	if code == 'udrdul':
		# kodzik z mrocznej uliczki
		var instance = scene.instantiate()
		instance.position = self.position
		get_tree().root.get_children()[0].get_node("world").add_child(instance)
		code = ''
	
	get_tree().get_nodes_in_group("Global indicators")[1].text = "Cats: "+str(int(koteły))
	
	if Input.is_action_just_pressed("ui_cancel"):
		if time>0 and game:
			# time = -1 # FOR DEBUG PURPOSES
			pass
		else:
			get_tree().change_scene_to_file("res://menu/stage_select.tscn")
	if time<0:
		game = false
		for item in get_tree().get_nodes_in_group("Game over items"):
			item.visible = true
		get_tree().get_nodes_in_group("Game over items")[1].text  = "Collected cats: "+str(int(koteły))
	if koteły>=MAX_CATS:
		game = false
		for item in get_tree().get_nodes_in_group("Game over items"):
			item.visible = true
		get_tree().get_nodes_in_group("Game over items")[0].position.y = -100
		get_tree().get_nodes_in_group("Game over items")[0].text  = "YOU CRAZY SON OF A BITCH\n YOU DID IT"
		get_tree().get_nodes_in_group("Game over items")[1].text  = "ALL "+str(int(koteły)) + " CATS COLLECTED"
	if game:
		movement(delta)
		get_tree().get_nodes_in_group("Global indicators")[0].text = "Time left: "+str(int(time))
		
		if has_key:
			get_tree().get_nodes_in_group("Global indicators")[2].visible = true
		else:
			get_tree().get_nodes_in_group("Global indicators")[2].visible = false
		
		time -= delta
	
	

func movement(delta):
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		vt += delta
		if vt>sound_freq:
			$sfx_player.stream = sound
			$sfx_player.play()
			vt = 0
		animation.set("parameters/Idle/blend_position", input_vector)
		animation.set("parameters/Walk/blend_position", input_vector)
		animation["parameters/conditions/moving"] = true
		animation["parameters/conditions/idle"] = false
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
	else:
		animation["parameters/conditions/idle"] = true
		animation["parameters/conditions/moving"] = false
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		var res = get_viewport_rect().size
		if event.position.x > res.x * 0.3 and event.position.x < res.x * 0.7 and event.position.y > res.y * 0.3 and event.position.y < res.y * 0.7:
			if kotek:
				kotek.delete()
				koteły += 1
		
