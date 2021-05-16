extends Node2D

var skill_01_unlocked = false

func _ready():
	$timer.start()
	
#	$characters/player.get_node("follow_cam/cam").limit_right = 1320
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass

func _process(delta):
	if skill_01_unlocked == false:
		if $characters/player.curr_health == 80:
			get_tree().paused = true
			$gui/skill_tutorial.show()


func _on_skill_btn_pressed():
	get_tree().paused = false
	$gui/skill_tutorial.hide()
	
	$characters/player.get_node("support").skills["cure"] = true
	$characters/player.get_node("hud/skill_box/skill_01").show()
	
	skill_01_unlocked = true
	pass # Replace with function body.


func _on_move_btn_pressed():
	get_tree().paused = false
	$gui/automatic_move_tutorial.hide()
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().paused = true
	$gui/automatic_move_tutorial.show()
	pass # Replace with function body.
