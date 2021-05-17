extends Node2D

var skill_unlocked = false

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

func _process(delta):
	if skill_unlocked == false:
		if $characters/player.poisoned == true:
			get_tree().paused = true
			$gui/skill_tutorial.show()

func _on_skill_btn_pressed():
	get_tree().paused = false
	$gui/skill_tutorial.hide()
	
	$characters/player.get_node("support").skills["antidote"] = true
	$characters/player.get_node("hud/skill_box/skill_02").show()
	
	skill_unlocked = true
	pass # Replace with function body.
