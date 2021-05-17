extends Node2D


func _ready():
	$characters/player.get_node("support").skills["cure"] = true
	$characters/player.get_node("hud/skill_box/skill_01").show()
	
	$characters/player.get_node("follow_cam/cam").limit_right = 900
	$objects/treasure_end.jokes = "No reward again?!"
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass
