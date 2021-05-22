extends Node2D


var skill_unlocked = false

func _ready():
	$characters/player.get_node("support").skills["cure"] = true
	$characters/player.get_node("hud/skill_box/skill_01").show()
	
	$characters/player.get_node("support").skills["antidote"] = true
	$characters/player.get_node("hud/skill_box/skill_02").show()
	
	$characters/player.get_node("follow_cam/cam").limit_right = 1588
	$objects/treasure_end.jokes = "That buff skill is kinda dangerous though D:"
	
	var np_lbl = $bg_music/now_playing/panel/label
	np_lbl.text = "LavaLand by Wolfgang"
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass


func _on_retry_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	get_parent().reload_this_scene("res://scenes/cave_01.tscn")
	pass # Replace with function body.


func _on_skill_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	$gui/skill_tutorial.hide()
	
	$characters/player.get_node("support").skills["buff"] = true
	$characters/player.get_node("hud/skill_box/skill_03").show()
	
	skill_unlocked = true
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().paused = true
	$gui/tut_pop.play()
	$gui/skill_tutorial.show()
	pass # Replace with function body.
