extends KinematicBody2D

var start_chat = ["Come on, let's go!", "Let's go get 'em!", "Killing monsters!"]

var end_chat = ["Winner takes ALL!", "Alright-oh!!", "The best reward.. a CHEST!"]

var vel = Vector2.ZERO

var movespd = 30.0

var battling_enemy = false
var is_dead = false
var poisoned = false

var curr_health
var max_health = 100

var hero_frame = 0
var weap_frame = 0

func _ready():
	$hero_anim.play("move")
	$supp_anim.play("move")
	
	$hero.frame = hero_frame
	$hero/weap.frame = weap_frame
	
	curr_health = max_health
	$hero_hp_bar.value = curr_health
	$hero_hp_bar.max_value = max_health
	
	#opening chat for each level
	randomize()
	var n = randi() % 3
	$chatbox.text = start_chat[n]
	$chatbox.show()
	$chat_anim.play("chat")
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
	print(curr_health)
	pass

func end_chat():
	randomize()
	var n = randi() % 3
	$chatbox.text = end_chat[n]
	$chatbox.show()
	$chat_anim.play("chat")

func heal(amount):
	if is_dead == false:
		curr_health += amount
		
		health_changes(curr_health)
		
		#limit max current health to max
		if curr_health > 100:
			curr_health = 100
		$hero_hp_bar.value = curr_health

func hurt(dmg_dealt):
	$hurt_anim.play("hurt_blink")
	
	curr_health -= dmg_dealt
	$hero_hp_bar.value = curr_health
	
	health_changes(curr_health)
	
	if curr_health <= 0:
		curr_health = 0
		
		is_dead = true
#		$hero_anim.play("death")
#		self.queue_free()
#		go back to main menu / hub
	pass

func health_changes(hp):
	#sprite changes depending on health
	if hp <= 100 and hp >= 81:
		$hero.frame = hero_frame
		$hero/weap.frame = weap_frame
	elif hp <= 80 and hp >= 61:
		$hero.frame = hero_frame + 1
	elif hp <= 60 and hp >= 41:
		$hero.frame = hero_frame + 2
		$hero/weap.frame = weap_frame + 1
	elif hp <= 40 and hp >= 21:
		$hero.frame = hero_frame + 3
	elif hp <= 20 and hp >= 1:
		$hero.frame = hero_frame + 4
		$hero/weap.frame = weap_frame + 2

func apply_poison():
	$effects_anim.play("poison")
	var ptimer = $hero/poison_timer
	
	if curr_health >= 10:
		curr_health -= 2
	else:
		pass
	$hero_hp_bar.value = curr_health
	
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


func _on_anim_animation_finished(anim_name):
	if anim_name == "chat":
		$chatbox.hide()
	pass # Replace with function body.


func _on_effects_anim_animation_finished(anim_name):
	poisoned = true
	pass # Replace with function body.
