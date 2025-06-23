extends Node2D

var ballscene = preload("res://ball.tscn")
var left_score = 0
var right_score = 0
var speed = 500
var velocity = Vector2.ZERO
var current_ball = null

func _ready():
	randomize()
	spawn_ball()

func spawn_ball():
	var ball = ballscene.instantiate()
	ball.position = get_viewport().size / 2
	ball.velocity = random_start_direction() * speed
	add_child(ball)
	print('ball spawned')

func random_start_direction():
	var angle = randf_range(-0.25, 0.25) * PI
	var direction = Vector2.RIGHT.rotated(angle)
	if randi() % 2 == 0:
		direction.x = -direction.x
	return direction.normalized()

# Remove this physics_process unless you want to move the main node itself
# func _physics_process(delta):
# 	position += velocity * delta

func _on_leftscore_body_entered(body):
	if body is CharacterBody2D:
		right_score += 1
		body.call_deferred("queue_free")
		call_deferred("spawn_ball")
		print('LEFTSCORE!')

func _on_rightscore_body_entered(body):
	if body is CharacterBody2D:
		left_score += 1
		body.call_deferred("queue_free")
		call_deferred("spawn_ball")
		print('RIGHTSCORE!')
