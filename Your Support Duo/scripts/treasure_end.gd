extends Area2D

var jokes = ""

func _ready():
	pass


func _on_treasure_end_body_entered(body):
	$gui/end/headline/anim.play("move")
	$gui/end/headline/blinker.play("blink")
	
	$gui/end/headline/label.text = jokes
	body.dance()
	body.end_chat()
	$gui/end.show()
	
	body.get_node("support").at_end = true
	pass # Replace with function body.
