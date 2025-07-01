extends CharacterBody2D #Player

var speed = 400


func _ready():
	add_to_group('paddle')

func _physics_process(_delta):
	get_input()
	move_and_slide()

func get_input():
	var direction = 0
	if Input.is_action_pressed('UP'):
		direction -= 1
	if Input.is_action_pressed('DOWN'):
		direction += 1
	velocity = Vector2(0, direction * speed)
