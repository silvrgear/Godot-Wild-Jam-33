extends Node2D

var skill_unlocked = false

func _ready():
	$characters/player.get_node("follow_cam/cam").limit_right = 1320
	$objects/treasure_end.jokes = "No reward is given to you as the hero takes it all."
	
	var np_lbl = $bg_music/now_playing/panel/label
	np_lbl.text = "Mystic Journey by Tausdei"
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass

func _process(delta):
	if skill_unlocked == false:
		if $characters/player.curr_health == 80:
			get_tree().paused = true
			$gui/tut_pop.play()
			$gui/skill_tutorial.show()


func _on_skill_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	$gui/skill_tutorial.hide()
	
	$characters/player.get_node("support").skills["cure"] = true
	$characters/player.get_node("hud/skill_box/skill_01").show()
	
	skill_unlocked = true
	pass # Replace with function body.


func _on_move_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	$gui/automatic_move_tutorial.hide()
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().paused = true
	$gui/tut_pop.play()
	$gui/automatic_move_tutorial.show()
	pass # Replace with function body.


func _on_retry_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	get_parent().reload_this_scene("res://scenes/plains_01.tscn")
	pass # Replace with function body.
