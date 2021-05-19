extends KinematicBody2D

export var speed = 40
var move_dir
var velocity = Vector2.ZERO

onready var interact = $interact
var interactable_object

var can_move = true

func _ready():
	pass

func _physics_process(delta):
	
	if can_move == true:
		move_dir = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	else:
		move_dir = 0
	
	if move_dir == 0:
		$anim.play("idle")
	else:
		$anim.play("move")
	
	velocity.x = move_dir * speed
	velocity = move_and_slide(velocity)
	
	_sprite_update()

func _sprite_update():
	if Input.is_action_pressed("right"):
		$sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		$sprite.flip_h = true

func _input(event):
	if Input.is_action_just_pressed("interact") and interactable_object != null:
		if interactable_object.has_method("interact"):
			interactable_object.interact()
		pass


func _on_interact_body_entered(body):
		interactable_object = body
		interactable_object.player_is_near = true


func _on_interact_body_exited(body):
		interactable_object.player_is_near = false
		interactable_object = null
