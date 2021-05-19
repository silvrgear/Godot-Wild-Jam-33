extends Area2D

var damage

var hit = false

func _ready():
	
	pass

func _physics_process(delta):
	if hit == false:
		translate(Vector2(-100 * delta, 0))
	else:
		translate(Vector2.ZERO)


func _on_projectile_body_entered(body):
	hit = true
	
	if $sprite.frame == 1:
		body.apply_poison()
	else:
		body.hurt(damage)
	
	if $sprite.frame == 0:
		$color.modulate = Color("#b13e53")
	if $sprite.frame == 1:
		$color.modulate = Color("#3b5dc9")
	if $sprite.frame == 2:
		$color.modulate = Color("#257179")
	
	$color/feedback.emitting = true
	$sprite.hide()
	
	$timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	self.queue_free()
	pass # Replace with function body.
