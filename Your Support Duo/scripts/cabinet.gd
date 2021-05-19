extends StaticBody2D

onready var player = get_parent().get_parent().get_node("characters/hub_player")

var player_is_near = false

func _ready():
	pass
	
func interact():
	print("quit game...")
	$gui/control.show()
	$cabin_sfx.play()
	player.can_move = false

func _process(delta):
	$button.visible = player_is_near


func _on_yes_pressed():
	$btn_click.play()
	get_tree().quit()
	pass # Replace with function body.


func _on_no_pressed():
	$btn_click.play()
	$gui/control.hide()
	player.can_move = true
	pass # Replace with function body.
