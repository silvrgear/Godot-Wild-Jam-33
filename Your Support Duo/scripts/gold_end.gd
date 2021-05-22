extends Area2D

var jokes = ""

var player

func _ready():
	pass


func _on_gold_end_body_entered(body):
	player = body
	
	$gui/end/headline/anim.play("move")
	$gui/end/headline/blinker.play("blink")
	
	$gui/end/headline/label.text = jokes
	$gui/end.show()
	
	body.get_node("support").at_end = true
	body.set_physics_process(false)
	body.get_node("bonk_anim").play("bonk")
	
	get_parent().get_parent().get_node("bg_music").playing = false
	pass # Replace with function body.


#func _on_home_btn_pressed():
#	$btn_click.play()
#	get_parent().get_parent().get_parent().go_back_to_hub()
#	pass # Replace with function body.
