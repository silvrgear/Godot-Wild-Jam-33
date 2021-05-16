extends KinematicBody2D

var curr_health

func _ready():
	$anim.play("idle")
	pass

func hurt(dmg_dealt):
	$anim.play("hurt")
	
	curr_health -= dmg_dealt
	if curr_health <= 0:
		curr_health = 0
		self.queue_free()
	pass


func _on_anim_animation_finished(anim_name):
	if anim_name == "hurt":
		$anim.play("idle")
	pass # Replace with function body.
