extends Node2D
var escena_bloque = preload("res://block.tscn")
const GRILLA = 54

onready var player: Node2D = $player
var rotacion: float = 0

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if(event.scancode == KEY_LEFT):
			if (player.is_on_floor() || player.is_on_ceiling() || player.is_on_wall()):
				rotacion -= 90
		if(event.scancode == KEY_RIGHT):
			if (player.is_on_floor() || player.is_on_ceiling() || player.is_on_wall()):
				rotacion += 90
		if(event.scancode == KEY_SPACE):
			if not (player.is_on_floor() || player.is_on_ceiling() || player.is_on_wall()):
				add_bloques()

# dado un vector posición, retorna otro vector ajustado a la grilla
func _posicion_a_grilla(posicion: Vector2):
	var grilla_x = int(posicion.x + GRILLA/2 - (int(posicion.x + GRILLA/2) % GRILLA))
	var grilla_y = int(posicion.y + GRILLA/2 - (int(posicion.y + GRILLA/2) % GRILLA))
	return Vector2(grilla_x, grilla_y)

func add_bloques():
	var pos_grilla = _posicion_a_grilla(player.position)
	for x in [-1, 0, 1]:
		var pos_bloque = pos_grilla
		# en y poner los bloques 2 filas más abajo que player:
		pos_bloque += Vector2.DOWN.rotated(player.rotation) * GRILLA * 2
		# en x poner 3 bloques, abajo de player y a los costados:
		pos_bloque += Vector2.RIGHT.rotated(player.rotation) * GRILLA * x
		var bloque = escena_bloque.instance()
		bloque.position = pos_bloque 
		add_child(bloque)

func _physics_process(delta):
	var nueva_rotacion: float = move_toward(rotation_degrees, rotacion, 80 * delta)
	rotation_degrees = nueva_rotacion
	player.rotation_degrees = -nueva_rotacion
