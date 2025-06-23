extends CharacterBody2D

@export var SPEED = 400

func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed('UP'):
		velocity.y -= 1
	if Input.is_action_pressed('DOWN'):
		velocity.y += 1
	velocity = velocity.normalized() * SPEED
	move_and_slide()
	




