extends CharacterBody2D

signal hit

var speed := 500

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	fly()
	move_and_slide()

func fly():
	if Input.is_action_just_pressed("UP"):
		velocity.y = -speed 
	
	
