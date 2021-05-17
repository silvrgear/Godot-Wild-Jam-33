tool
extends "res://scripts/enemy.gd"

onready var projectile = preload("res://entities/projectile.tscn")

var is_attacking = false

export var damage = 10
export var max_health = 100
export var spr_frame = 0
export var shoot_delay = 2.5

func _ready():
	$sprite.frame = spr_frame
	
	curr_health = max_health
	pass

func _physics_process(delta):
	#shooting slime projectiles
	if $range_ray.is_colliding() and !is_attacking:
		is_attacking = true
		
		$anim.play("shoot")
		
		var x = projectile.instance()
		var proj = get_parent().get_parent().get_node("projectiles")
		
		proj.add_child(x)
		x.get_node("sprite").frame = spr_frame
		x.position = self.global_position
		x.damage = damage

func _on_anim_animation_finished(anim_name):
	if anim_name == "shoot":
		$anim.play("idle")
		
		$timer.start(shoot_delay)
	pass # Replace with function body.


func _on_timer_timeout():
	is_attacking = false
	pass # Replace with function body.
