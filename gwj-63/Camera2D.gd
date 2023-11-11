extends Camera2D

@onready var Top = $Limits/TopLeft
@onready var Bottom = $Limits/BottomRight

func _ready():
	limit_top = Top.position.y
	limit_left = Top.position.x
	limit_bottom = Bottom.position.y
	limit_right = Bottom.position.x
