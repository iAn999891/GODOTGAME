extends Sprite2D


# Adjust this number to change the spin speed
var rotation_speed: float = 2 * 3.14 # Pi radians (about 180 degrees) per second

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
	#scale += Vector2(0.8 * delta, 0.8 * delta)
