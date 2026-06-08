extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game_scene/Player")

@export var damage = 15

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 50
	
	if player.global_position.x > global_position.x:
		$BabyCarrotSprite.flip_h = true
	else:
		$BabyCarrotSprite.flip_h = false
	move_and_slide()

func take_damage():
	health -= 1
			
	if health == 0:
		queue_free()
