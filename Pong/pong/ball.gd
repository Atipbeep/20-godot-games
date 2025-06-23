extends CharacterBody2D

var speed = 600

func _ready():
    add_to_group("ball")
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
        if collision.get_collider().name == "Paddle":
            velocity = velocity.bounce(collision.get_normal())
            speed += 20  # Increase speed on each paddle hit
        else:
            velocity = velocity.bounce(collision.get_normal())
    else:
        position += velocity * delta
