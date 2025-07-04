extends Node2D

@export var pipe_scene: PackedScene
@export var spawn_interval := 1.5  # seconds

var timer := 0.0

func _process(delta: float) -> void:
	timer -= delta
	if timer <= 0.0:
		_spawn_pipe()
		timer = spawn_interval

func _spawn_pipe() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(get_viewport_rect().size.x  + 75, 568)  # spawn off-screen to right
	add_child(pipe)
