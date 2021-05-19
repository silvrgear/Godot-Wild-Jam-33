extends StaticBody2D

var player_is_near = false

func _ready():
	pass
	
func interact():
	print("show help....")

func _process(delta):
	$button.visible = player_is_near
