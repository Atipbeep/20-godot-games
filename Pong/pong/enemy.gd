extends CharacterBody2D

@export var speed: float = 300  # Adjust for difficulty
var ball = null 

func _ready():
	call_deferred("_find_ball")
    # Adjust this path to point to your ball node
    ball = get_parent().get_node("Ball")

func _physics_process(delta):
    if not ball:
        return
    if abs(ball.position.y - position.y) > 5:  # Dead zone to prevent jitter
        if ball.position.y > position.y:
            position.y += speed * delta
        else:
            position.y -= speed * delta

func _find_ball():
	var balls = get_tree().get_nodes_in_group("ball")
	if balls.size() > 0:
		ball = balls[0]
