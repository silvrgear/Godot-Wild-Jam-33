extends Area2D

var jokes = ""

func _ready():
	pass


func _on_treasure_end_body_entered(body):
	$gui/end/headline/anim.play("move")
	$gui/end/headline/blinker.play("blink")
	
	$gui/end/headline/label.text = jokes
	$gui/end.show()
	
	body.get_node("support").at_end = true
	body.dance()
	body.end_chat()
	
	get_parent().get_parent().get_node("bg_music").playing = false
	pass # Replace with function body.


func _on_home_btn_pressed():
	$btn_click.play()
	get_parent().get_parent().get_parent().go_back_to_hub()
	pass # Replace with function body.
