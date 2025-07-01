extends CharacterBody2D

var mainspeed = 250
var onhitspeed = 50

func _ready() -> void:
	var angle = randf_range(-PI / 4, PI / 4)
	var direction = Vector2(cos(angle), sin(angle)).normalized()
	var angle_offset = 0.0 if randf() < 0.5 else PI
	add_to_group('balls')

	velocity = direction.rotated(angle_offset) * mainspeed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)

	if collision:
		var collider = collision.get_collider()

		if collider.is_in_group('paddle'):
			mainspeed += onhitspeed
			$Hit.play()

		velocity = velocity.bounce(collision.get_normal()).normalized() * mainspeed

