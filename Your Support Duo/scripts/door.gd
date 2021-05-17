extends StaticBody2D

var player_is_near = false

func _ready():
	pass
	
func interact():
	print("start/continue....")

func _process(delta):
	$key.visible = player_is_near
