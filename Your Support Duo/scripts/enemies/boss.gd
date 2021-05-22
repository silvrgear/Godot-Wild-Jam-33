extends KinematicBody2D

signal low_hp

onready var projectile = preload("res://entities/spear.tscn")

var curr_health
var max_health = 70

var is_attacking = false

var damage = 20
var atk_delay = 1.0

var move_x = 100
var timed = false

func _ready():
	$anim.play("idle")
	
	curr_health = max_health
	pass

func _physics_process(delta):
	$hp.text = str(curr_health)
	if curr_health <= 50:
		translate(Vector2(move_x * delta, 0))
		if timed == false:
			timed = true
			emit_signal("low_hp")
	
	if $range_ray.is_colliding() and !is_attacking:
		is_attacking = true
		
		$anim.play("shoot")
	
	print($timer.time_left)

func spawn_spear():
		var x = projectile.instance()
		var proj = get_parent().get_parent().get_node("projectiles")
		
		proj.add_child(x)
		x.position = $weapon.global_position
		x.damage = damage

func hurt(dmg_dealt):
	$hurt_anim.play("hurt")
	
	curr_health -= dmg_dealt
	if curr_health <= 0:
		curr_health = 0
		self.queue_free()
	pass


func _on_anim_animation_finished(anim_name):
	if anim_name == "shoot":
		$anim.play("idle")
		
		is_attacking = false
	pass # Replace with function body.

func _on_boss_low_hp():
	$timer.start(3.0)
	pass # Replace with function body.

func _on_timer_timeout():
	move_x = 0
	pass # Replace with function body.







