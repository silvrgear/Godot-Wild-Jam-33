extends Node2D


func _ready():
	$characters/player.get_node("support").skills["cure"] = true
	$characters/player.get_node("hud/skill_box/skill_01").show()
	
	$characters/player.get_node("follow_cam/cam").limit_right = 900
	$objects/treasure_end.jokes = "No reward again?!"
	
	var np_lbl = $bg_music/now_playing/panel/label
	np_lbl.text = "Mystic Journey by Tausdei"
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass


func _on_retry_btn_pressed():
	$gui/btn_click.play()
	get_tree().paused = false
	get_parent().reload_this_scene("res://scenes/plains_02.tscn")
	pass # Replace with function body.
