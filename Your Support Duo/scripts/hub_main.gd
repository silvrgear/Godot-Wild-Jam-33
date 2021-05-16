extends Node2D

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass
