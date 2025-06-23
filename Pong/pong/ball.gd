extends CharacterBody2D

var speed = 300

func _ready():
    # Set the ball's velocity to a random left or right direction with a slight vertical angle
    velocity = random_start_direction() * speed

func random_start_direction():
    var angle = randf_range(-0.25, 0.25) * PI  # Slight vertical randomness
    var direction = Vector2.RIGHT.rotated(angle)
    if randi() % 2 == 0:
        direction.x = -direction.x  # Randomly flip left or right
    return direction.normalized()

func _physics_process(delta):
    var collision = move_and_collide(velocity * delta)
    if collision:
        # Bounce off by reflecting the velocity over the collision normal
        velocity = velocity.bounce(collision.get_normal())
