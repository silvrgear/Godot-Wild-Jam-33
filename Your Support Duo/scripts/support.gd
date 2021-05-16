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

func _ready():
	curr_mana = max_mana
	
	#enable skill
#	skills["cure"] = true
	
	$mana_canister/mana_progress.value = curr_mana
	pass

func _input(event):
	var skill_01_prog = player.get_node("hud/skill_box/skill_01/progress")
	
	if event.is_action_pressed("q") and skills["cure"] == true:
		if skill_01_prog.value == 0 and curr_mana >= 20:
			curr_mana -= 20
			$mana_canister/mana_progress.value = curr_mana
			
			player.heal(20)
			skill_01_prog.value = 100
			skill_cd(skill_01_prog, 4.0)
	pass

func skill_cd(obj, time):
	var tw = obj.get_node("tween")
	
	tw.interpolate_property(obj, "value", 100, 0, time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tw.start()
	pass






