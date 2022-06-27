extends KinematicBody2D

var motion = Vector2()

# Se encarga de hacer que el personaje
# baje.
func _physics_process(delta):
	motion.x = 0
	motion.y = 100
	move_and_slide(motion)
