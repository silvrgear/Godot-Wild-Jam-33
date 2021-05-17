extends StaticBody2D

var player_is_near = false

func _ready():
	pass
	
func interact():
	print("quit game....")

func _process(delta):
	$key.visible = player_is_near
