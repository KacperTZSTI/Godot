extends Node2D
@export var bus : Node = null

var time = 0;
var bus_exists = true;

var BUS_EVENT_START = 100;
var BUS_STOP = 121;
var BUS_START_AGAIN = 128;
var BUS_EVENT_END = 140
var BUS_SPEED = 350;

func _ready():
	pass


func _process(delta):
	time += delta;
	if time >BUS_EVENT_START and time < BUS_STOP:
		bus.visible = true;
		bus.position.x -= BUS_SPEED*delta;
	if time> BUS_START_AGAIN and time <BUS_EVENT_END:
		bus.visible = true;
		bus.position.x -= BUS_SPEED*delta;
	if time >BUS_EVENT_END and bus_exists:
		bus.get_tree().queue_delete(bus)
		bus_exists = false;
