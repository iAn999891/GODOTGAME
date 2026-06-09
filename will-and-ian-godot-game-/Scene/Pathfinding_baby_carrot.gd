extends NavigationAgent2D

@onready var player = get_node("/root/Game_scene/Player")

@export var move_speed: float = 200

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

func _physics_prosses(delta: float) -> void:
	var current_postion: Vector2 = self.global_transform.origin
	var next_path_position: Vector2 = nav_agent.get_next_path_postion()
	var new_velocity: Vector2 = current_postion.direction_to(next_path_position)
	nav_agent.velocity = new_velocity
	update_target_position(player.global_transform.origin)
	
func update_target_position(target_pos: Vector2):
	nav_agent.target_position = target_pos
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = velocity.move_toward(safe_velocity * move_speed, 45.0)
