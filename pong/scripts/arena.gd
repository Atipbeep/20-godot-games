extends Node2D

@onready var leftscorelabel = $Scoreboard/Leftscore
@onready var rightscorelabel = $Scoreboard/Rightscore
var ball_scene = preload("res://scenes/ball.tscn")

var leftscore = 0
var rightscore = 0


func _ready() -> void:
	spawn_ball()

func spawn_ball():
	var ball = ball_scene.instantiate()
	ball.position = get_viewport_rect().size / 2
	add_child(ball)

func _on_r_goal_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print('Right Side Score')
		body.queue_free()
		leftscore += 1
		leftscorelabel.text = str(leftscore)
		await get_tree().create_timer(3.0).timeout
		spawn_ball()


func _on_l_goal_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.queue_free()
		rightscore += 1
		rightscorelabel.text = str(rightscore)
		print('Left Side Score')
		await get_tree().create_timer(3.0).timeout
		spawn_ball()
