extends ColorRect

var time  = 0

# level 2 lasts 120s
var TRANSITION_START = 100
var TRANSITION_DURATION = 110

var R_START = 0
var G_START = 0.47
var B_START = 0.22

var R_END = 0.001
var G_END = 0.12
var B_END = 0.06

# Called when the node enters the scene tree for the first time.
func _ready():
	color = Color(R_START, G_START, B_START)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	# myślałem nad tym algorytmem przez ponad godzinę (bez chatGPT and Stack Overflow)
	# następne trzy linijki zawierają *naprawdę* ciężką matematykę
	if time > TRANSITION_START and time < TRANSITION_START + TRANSITION_DURATION:
		var weight = (time - TRANSITION_START)/TRANSITION_DURATION
		color = Color( R_START + weight*(R_END-R_START)  , G_START + weight*(G_END-G_START) , B_START + weight*(B_END-B_START) )
