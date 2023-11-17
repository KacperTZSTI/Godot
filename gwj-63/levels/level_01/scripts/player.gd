extends RigidBody2D

var speed = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed('ui_up'):
		
		velocity.y -= speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
	if Input.is_action_pressed('ui_down'):
		velocity.y += speed
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
		
	
	apply_impulse(velocity, Vector2.ZERO)
	rotation = linear_velocity.angle()
