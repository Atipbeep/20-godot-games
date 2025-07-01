extends CharacterBody2D #Enemy


@export var speed: float = 400.0
var reaction = 20

func _ready():
	add_to_group('paddle')

func _physics_process(delta):
	var balls = get_tree().get_nodes_in_group('balls')
	if balls.size() == 0: 
		velocity.y = 0 
		return

	var ball = balls[0]

	var y_diff = ball.global_position.y - global_position.y
	velocity.y = speed * sign(y_diff)

	if abs(y_diff) > reaction:
		velocity.y = speed * sign(y_diff)
	else:
		velocity.y = 0

	move_and_slide()
