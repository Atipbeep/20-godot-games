extends CharacterBody2D

var speed = 250

func _ready() -> void:
	var angle = randf_range(-PI / 4, PI / 4)
	var direction = Vector2(cos(angle), sin(angle)).normalized()
	var angle_offset = 0.0 if randf() < 0.5 else PI

	velocity = direction.rotated(angle_offset) * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)

	if collision:
		var normal = collision.get_normal()

		velocity = velocity.bounce(normal)

