extends Sprite


func _input(event):
	# Este script es muy parecido al de Node 2D (stage), solo
	# que hace rotar al personaje en el sentido opuesto, para
	# que siempre tenga los pies hacia abajo.
	if event is InputEventKey and event.is_pressed():
		if(event.scancode == KEY_LEFT):
			self.rotation_degrees += 90
		if(event.scancode == KEY_RIGHT):
			self.rotation_degrees -= 90
