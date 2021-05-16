extends Area2D

func _ready():
	pass


func _on_treasure_end_body_entered(body):
	body.dance()
	$gui/end.show()
	pass # Replace with function body.
