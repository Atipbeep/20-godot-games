extends CharacterBody2D

var gravity = 1000
var flap_strength = -350

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_pressed("UP"):
		velocity.y = flap_strength
	move_and_slide()
