extends KinematicBody2D

var vel = Vector2.ZERO

var movespd = 30.0

var battling_enemy = false
var is_dead = false

var curr_health
var max_health = 100

func _ready():
	$hero_anim.play("move")
	$supp_anim.play("move")
	
	curr_health = max_health
	$hero_hp_bar.value = curr_health
	$hero_hp_bar.max_value = max_health
	pass

func _physics_process(delta):
	if battling_enemy == true:
		$hero_anim.play("attack")
		
		vel.x = 0
	elif is_dead == true:
		vel.x = 0
	else:
		vel.x = movespd
	
	move_and_slide(vel)
	pass

func heal(amount):
	if is_dead == false:
		curr_health += amount
		
		#limit max current health to max
		if curr_health > 100:
			curr_health = 100
		$hero_hp_bar.value = curr_health

func hurt(dmg_dealt):
	$hurt_anim.play("hurt_blink")
	
	curr_health -= dmg_dealt
	$hero_hp_bar.value = curr_health
	if curr_health <= 0:
		curr_health = 0
		
		is_dead = true
#		$hero_anim.play("death")
#		self.queue_free()
#		go back to main menu / hub
	pass

func apply_poison():
	$effects_anim.play("poison")
	var ptimer = $hero/poison_timer
	
	if curr_health > 10:
		curr_health -= 2
	$hero_hp_bar.value = curr_health
	print(curr_health)
	ptimer.start()
	pass

func dance():
	self.set_physics_process(false)
	
	$hero_anim.play("dance")
	$supp_anim.play("dance")
	pass

func _on_hero_anim_animation_finished(anim_name):
	if anim_name == "attack":
		$hero_anim.play("move")
		
		$hitbox.monitoring = false
		$hitbox.monitorable = false
		
		if $enemy_area.get_overlapping_bodies().empty() == true:
			battling_enemy = false
	pass # Replace with function body.


func _on_enemy_area_body_entered(body):
	$hero_anim.play("attack")
	
	battling_enemy = true
	pass # Replace with function body.


func _on_hitbox_body_entered(body):
	body.hurt(10)
	pass # Replace with function body.


func _on_poison_timer_timeout():
	apply_poison()
	pass # Replace with function body.
