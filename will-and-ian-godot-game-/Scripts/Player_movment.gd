extends CharacterBody2D

@export var movement_speed : float = 500
var character_direction : Vector2

signal health_depleted

var health = 150.0

func _physics_process(_delta):
	if get_global_mouse_position().x < global_position.x:
		%sprite.flip_h = true
	else:
		%sprite.flip_h = false
	
	character_direction.x = Input.get_axis("Move_left", "Move_right")
	character_direction.y = Input.get_axis("Move_up", "Move_down")
	character_direction = character_direction.normalized()
	
	if character_direction.x > 0: %sprite.flip_h = false
	elif character_direction.x < 0: %sprite.flip_h = true
	
	if character_direction:
		velocity = character_direction * movement_speed
		if %sprite.animation != "Walking": %sprite.animation = "Walking"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "Idle": %sprite.animation = "Idle"
		
	move_and_slide()
	
	const DAMAGE_RATE = 500
	var overlapping_mobs = %Hitbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * _delta
		if health <= 0.0:
			health_depleted.emit()
