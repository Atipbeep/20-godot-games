extends CharacterBody2D

var ball = null
var speed := 200  # Adjust for paddle speed

func _ready() -> void:
	add_to_group('paddle')

func _process(_delta):
	# Look for the ball if we don't have it, or if it was removed (e.g., after scoring)
	if ball == null or not is_instance_valid(ball):
		if get_parent().has_node("Ball"):
			ball = get_parent().get_node("Ball")
		else:
			return  # Ball not spawned yet, do nothing this frame

	# Move towards the ball's Y position
	if abs(ball.position.y - position.y) > 5:  # Deadzone to prevent jitter
		if ball.position.y > position.y:
			position.y += speed * _delta
		else:
			position.y -= speed * _delta
