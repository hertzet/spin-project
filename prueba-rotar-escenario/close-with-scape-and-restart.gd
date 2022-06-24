extends Node2D

func _ready():
	set_process(true)

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if(event.scancode == KEY_ESCAPE):
			get_tree().quit()
		if(event.scancode == KEY_R):
			get_tree().reload_current_scene()

