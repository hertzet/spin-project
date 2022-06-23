extends Node2D

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if(event.scancode == KEY_LEFT):
			self.rotation_degrees -= 90
		if(event.scancode == KEY_RIGHT):
			self.rotation_degrees += 90
