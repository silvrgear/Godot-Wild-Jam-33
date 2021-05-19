extends StaticBody2D

onready var player = get_parent().get_parent().get_node("characters/hub_player")

var player_is_near = false

func _ready():
	pass
	
func interact():
	print("start/continue....")
	$gui/control.show()
	$open_door_sfx.play()
	player.can_move = false

func _process(delta):
	$button.visible = player_is_near


func _on_yes_pressed():
	$btn_click.play()
	$gui/control.hide()
	get_parent().get_parent().get_parent().change_to_next_scene()
	pass # Replace with function body.


func _on_no_pressed():
	$btn_click.play()
	$gui/control.hide()
	player.can_move = true
	pass # Replace with function body.
