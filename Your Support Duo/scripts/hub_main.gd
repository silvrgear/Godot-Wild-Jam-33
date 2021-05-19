extends Node2D

var new_start

func _ready():
	if new_start == true:
		$anim.play("fade")
	else:
		$tutorial.hide()
	pass

func _input(event):
	if event.is_action_pressed("restart"):
		Global.reload()
	pass


func _on_anim_animation_finished(anim_name):
	if anim_name == "fade":
		$tutorial.queue_free()
	pass # Replace with function body.
