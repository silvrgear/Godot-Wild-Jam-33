extends Area2D

var damage

func _ready():
	pass

func _physics_process(delta):
	translate(Vector2(-100 * delta, 0))


func _on_projectile_body_entered(body):
	if $sprite.frame == 1:
		body.apply_poison()
	
	body.hurt(damage)
	
	#spawn feedback effect
	self.queue_free()
	pass # Replace with function body.
