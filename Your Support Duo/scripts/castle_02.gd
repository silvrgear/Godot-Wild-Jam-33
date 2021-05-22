extends Node2D


func _ready():
	$characters/player.get_node("support").skills["cure"] = true
	$characters/player.get_node("hud/skill_box/skill_01").show()
	
	$characters/player.get_node("support").skills["antidote"] = true
	$characters/player.get_node("hud/skill_box/skill_02").show()
	
	$characters/player.get_node("support").skills["buff"] = true
	$characters/player.get_node("hud/skill_box/skill_03").show()
	
	$characters/player.get_node("support").skills["invincibility"] = true
	$characters/player.get_node("hud/skill_box/skill_04").show()
	
	$characters/player.get_node("follow_cam/cam").limit_right = 1574
	$objects/gold_end.jokes = "She's so done with this."
	
	var np_lbl = $bg_music/now_playing/panel/label
	np_lbl.text = "Fantasy Armies by Alexandr Zhelanov"
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass


func _on_retry_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	get_parent().reload_this_scene("res://scenes/castle_02.tscn")
	pass # Replace with function body.


func _on_bonk_anim_animation_finished(anim_name):
	if anim_name == "bonk":
		$characters/player/hud/skill_box.hide()
		$gui/panel.show()
		$gui/panel/anim.play("blink")
	pass # Replace with function body.
