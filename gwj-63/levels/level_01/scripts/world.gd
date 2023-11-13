extends Node2D
@export var bus : Node = null

var time = 0;
var bus_exists = true;

var BUS_EVENT_START = 5;
var BUS_EVENT_END = 7;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta;
	if time >BUS_EVENT_START and time < BUS_EVENT_END:
		bus.visible = true;
		bus.linear_velocity.x = 70;
	if time >BUS_EVENT_END and bus_exists:
		bus.get_tree().queue_delete(bus)
		bus_exists = false;
