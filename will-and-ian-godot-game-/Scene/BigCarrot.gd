extends CharacterBody2D

var health = 3

@export var damage = 25
@export var move_speed = 45

@onready var player = get_node("/root/Game_scene/Player")

func _physics_process(_delta):

	if player == null:
		return

	var direction = global_position.direction_to(player.global_position)
	velocity = direction * move_speed

	# Flip sprite
	if velocity.x < 0:
		$BigCarrotSprite.flip_h = true
	else:
		$BigCarrotSprite.flip_h = false

	move_and_slide()

func take_damage():
	health -= 1

	if health <= 0:
		Global.points += 15
		queue_free()
