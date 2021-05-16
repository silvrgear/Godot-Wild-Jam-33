extends KinematicBody2D

export var speed = 180
var velocity = Vector2.ZERO

onready var interact = $interact
var interactable_object

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("down"):
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		velocity.y = -speed
	else:
		velocity.y = 0

	velocity = move_and_slide(velocity)

func _process(delta):
	if interact.get_overlapping_bodies():
		interactable_object = interact.get_overlapping_bodies()[0]
	else:
		interactable_object = null

func _input(event):
	if Input.is_action_just_pressed("interact") and interactable_object != null:
		interactable_object.interact()
		pass
