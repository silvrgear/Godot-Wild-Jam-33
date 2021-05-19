extends StaticBody2D

onready var player = get_parent().get_parent().get_node("characters/hub_player")

var player_is_near = false

func _ready():
	pass
	
func interact():
	if $gui/control.visible == false:
		print("show credits....")
		$gui/control.show()
		$fr_anim.play("shing")
		$gui/control/anim.play("fade")
		player.can_move = false

func _process(delta):
	$button.visible = player_is_near


func release_player():
	player.can_move = true

func _on_anim_animation_finished(anim_name):
	if anim_name == "fade":
		$gui/control.hide()
	pass # Replace with function body.
