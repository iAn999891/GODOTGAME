extends CharacterBody2D

var health = 2

@export var damage = 15
@export var move_speed = 50

@onready var player = get_node("/root/Game_scene/Player")

func _physics_process(_delta):

	if player == null:
		return

	var direction = global_position.direction_to(player.global_position)
	velocity = direction * move_speed

	# Flip sprite
	if velocity.x < 0:
		$BabyCarrotSprite.flip_h = true
	else:
		$BabyCarrotSprite.flip_h = false

	move_and_slide()

func take_damage():
	health -= 1

	if health <= 0:
		Global.points += 5
		queue_free()
