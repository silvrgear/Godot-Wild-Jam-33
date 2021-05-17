extends KinematicBody2D

var curr_health
var max_health = 30

var is_attacking = false

var damage = 20
var atk_delay = 1.0

func _ready():
	$anim.play("idle")
	
	curr_health = max_health
	pass

func _physics_process(delta):
	if $range_ray.is_colliding() and !is_attacking:
		is_attacking = true
		
		$anim.play("attack")

func hurt(dmg_dealt):
	$hurt_anim.play("hurt")
	
	curr_health -= dmg_dealt
	if curr_health <= 0:
		curr_health = 0
		self.queue_free()
	pass


func _on_anim_animation_finished(anim_name):
	if anim_name == "attack":
		$anim.play("idle")
		
		is_attacking = false
		$hitbox.monitorable = false
		$hitbox.monitoring = false
	pass # Replace with function body.

func _on_hitbox_body_entered(body):
	body.hurt(damage)
	pass # Replace with function body.






