extends CharacterBody2D

var health = 1

@onready var player = get_node("/root/Game_scene/Player")

@export var damage = 50

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 85
	
	if player.global_position.x > global_position.x:
		$BigOnionSprite.flip_h = true
	else:
		$BigOnionSprite.flip_h = false
	move_and_slide()

func take_damage():
	health -= 1
			
	if health == 0:
		Global.points += 15
		queue_free()
