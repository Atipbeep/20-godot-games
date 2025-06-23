extends Node2D

var ballscene = preload("res://ball.tscn")
var speed = 300
var velocity = Vector2.ZERO

func _ready():
	randomize()  # ensures different results each run
	spawn_ball()

func spawn_ball():
	var ball = ballscene.instantiate()
	ball.position = get_viewport().size / 2
	ball.velocity = random_start_direction() * speed
	add_child(ball)


func random_start_direction():
	var angle = randf_range(-0.25, 0.25) * PI
	var direction = Vector2.RIGHT.rotated(angle)
	if randi() % 2 == 0:
		direction.x = -direction.x
	return direction.normalized()

func _physics_process(delta):
	position += velocity * delta
