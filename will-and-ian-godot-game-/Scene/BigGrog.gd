extends CharacterBody2D

var health = 8

@export var damage = 35
@export var move_speed = 30

@onready var player = get_node("/root/Game_scene/Player")
@onready var nav_agent = $NavigationAgent2D

func _physics_process(_delta):

	if player == null:
		return

	# Tell the agent where we want to go
	nav_agent.target_position = player.global_position

	# Get next point on the path
	var next_pos = nav_agent.get_next_path_position()

	# Move toward that point
	var direction = global_position.direction_to(next_pos)
	velocity = direction * move_speed

	# Flip sprite
	if velocity.x < 0:
		$BigGrogSprite.flip_h = true
	else:
		$BigGrogSprite.flip_h = false
	move_and_slide()

func take_damage():
	health -= 1

	if health <= 0:
		queue_free()
