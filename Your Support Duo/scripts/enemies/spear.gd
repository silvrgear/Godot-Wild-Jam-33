extends Area2D

var damage

var hit = false
var hero

func _ready():
	hero = get_parent().get_parent().get_node("characters/player/hero")
	pass

func _physics_process(delta):

	if hit == false:
		look_at(hero.global_position)
		target_hero()
	else:
		translate(Vector2.ZERO)

func target_hero():
	var tw = $tween
	tw.interpolate_property(self, "global_position", global_position, hero.global_position,
							0.2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tw.start()

func _on_projectile_body_entered(body):
	hit = true
	
	body.hurt(damage)
	
	$color/feedback.emitting = true
	
	$timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	self.queue_free()
	pass # Replace with function body.
