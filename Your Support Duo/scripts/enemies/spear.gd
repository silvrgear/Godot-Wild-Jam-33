extends Area2D

var damage = 20

var hit = false

func _ready():
	
	pass

func _physics_process(delta):
	if hit == false:
		translate(Vector2(-100 * delta, -20))
	else:
		translate(Vector2.ZERO)


func _on_projectile_body_entered(body):
	hit = true
	
	body.hurt(damage)
	
	$color/feedback.emitting = true
	
	$timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	self.queue_free()
	pass # Replace with function body.
