extends Node2D


func _ready():
	new_game()

func new_game():
	$Bird.position = $StartPos.position
	$Floor.position = $FloorPos.position
