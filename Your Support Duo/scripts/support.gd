extends Sprite

onready var player = get_parent()

var skills = {
	"cure"          : false,
	"antidote"      : false,
	"buff"          : false,
	"invincibility" : false,
}

var curr_mana
var max_mana = 100

var at_end = false

func _ready():
	curr_mana = max_mana
	
	#enable skill
#	skills["cure"] = true
	
	$mana_canister/mana_progress.value = curr_mana
	pass

func _input(event):
	var skill_01_prog = player.get_node("hud/skill_box/skill_01/spr/progress")
	var skill_02_prog = player.get_node("hud/skill_box/skill_02/spr/progress")
	var skill_03_prog = player.get_node("hud/skill_box/skill_03/spr/progress")
	var skill_03 = player.get_node("hud/skill_box/skill_03")
	var skill_04_prog = player.get_node("hud/skill_box/skill_04/spr/progress")
	
	if at_end == false:
		#cure skill
		if event.is_action_pressed("q") and skills["cure"] == true:
			if skill_01_prog.value == 0 and curr_mana >= 20:
				curr_mana -= 20
				$mana_canister/mana_progress.value = curr_mana
				
				player.heal(20)
				player.get_node("hud/skill_box/skill_01/anim").play("enlarge")
				skill_01_prog.value = 100
				skill_cd(skill_01_prog, 4.0)
		
		#antidote skill
		if event.is_action_pressed("w") and skills["antidote"] == true:
			if skill_02_prog.value == 0 and curr_mana >= 20:
				curr_mana -= 20
				$mana_canister/mana_progress.value = curr_mana
				
				player.remove_poison()
				player.get_node("hud/skill_box/skill_02/anim").play("enlarge")
				skill_02_prog.value = 100
				skill_cd(skill_02_prog, 8.0)
		
		#buff skill
		if event.is_action_pressed("e") and skills["buff"] == true:
			if player.battling_enemy == false:
				if skill_03_prog.value == 0 and curr_mana >= 40:
					curr_mana -= 40
					$mana_canister/mana_progress.value = curr_mana
					
					player.buff()
					player.get_node("hud/skill_box/skill_03/anim").play("enlarge")
					skill_03_prog.value = 100
					skill_cd(skill_03_prog, 10.0)
			else:
				skill_03.get_node("anim").play("in_battle")
		
		#invincibility skill
		if event.is_action_pressed("r") and skills["invincibility"] == true:
			if skill_04_prog.value == 0 and curr_mana >= 40:
				curr_mana -= 40
				$mana_canister/mana_progress.value = curr_mana
				
				player.activate_invincibility()
				player.get_node("hud/skill_box/skill_04/anim").play("enlarge")
				skill_04_prog.value = 100
				skill_cd(skill_04_prog, 20.0)
	pass

func skill_cd(obj, time):
	var tw = obj.get_node("tween")
	
	tw.interpolate_property(obj, "value", 100, 0, time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tw.start()
	pass


func _on_supp_anim_animation_finished(anim_name):
	if anim_name == "heal":
		get_parent().get_node("supp_anim").play("move")
	pass # Replace with function body.






