extends CharacterBody2D

const GRAVITY = 1000

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	get_input()
	move_and_slide()

func get_input():
	if Input.is_action_just_pressed("UP"):
		velocity.y = -500



