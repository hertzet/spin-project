extends KinematicBody2D

var motion: Vector2 = Vector2()

# Se encarga de hacer que el personaje
# baje.
func _physics_process(_delta):
	motion.x = 0
	motion.y = 100
	# solo mover si está ubicado en ángulo recto
	if int(abs(rotation_degrees)) % 90 == 0:
		move_and_slide(motion)
