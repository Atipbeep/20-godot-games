extends Node2D

var speed = 200
var gap_size = 150
var min_gap_y = 100
var max_gap_y =  800

func _ready():
	randomize()
	set_gap()

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -20:
		queue_free()

func set_gap():
	var gap_y = randf_range(min_gap_y, max_gap_y)
	var half_gap = gap_size / 2
	var pipe_height = $Pipe/ColorRect.size.y

	$Pipe.position.y = gap_y - half_gap - pipe_height
	$Pipe2.position.y = gap_y + half_gap


func _on_score_body_entered(body:Node2D) -> void:
	print("1")
