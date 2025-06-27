extends CharacterBody2D

var speed = 60

func _ready():
    add_to_group("ball")
    # Set the ball's velocity to a random left or right direction with a slight vertical angle

func _physics_process(delta):
    var collision = move_and_collide(velocity * delta)
    if collision and collision.get_collider().name == "Paddle":
        # Reflect velocity
        velocity = velocity.bounce(collision.get_normal()).normalized()
        # Slightly move ball out of collision
        position += collision.get_normal() * 2
        # Increase speed if desired
        speed *= 1.1

