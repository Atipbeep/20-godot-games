extends Control

func _ready():
	hide()
	resume()

func resume():
	hide()
	get_tree().paused = false

func pause():
	get_tree().paused = true 

func pausing():
	if Input.is_action_just_pressed("PAUSE") and get_tree().paused == false:
		pause()
		show()
	elif Input.is_action_just_pressed("PAUSE") and get_tree().paused == true:
		resume()

func _process(delta: float) -> void:
	pausing()

		
func _on_backtomenu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_resume_pressed() -> void:
	resume()
