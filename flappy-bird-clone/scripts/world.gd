extends Node2D

@export var pipe_scene: PackedScene

func _ready():
	new_game()
	spawn_pipes()

func new_game():
	$Bird.position = $StartPos.position
	$Floor.position = $FloorPos.position

func spawn_pipes():
	var pipe = pipe_scene.instantiate()
	$pipes.postition.x = 500
	add_child(pipe)
