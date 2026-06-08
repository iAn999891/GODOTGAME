extends Node2D


func spawn_carrot():
	var new_mob = preload("res://Scene/BabyCarrot.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_onion():
	var new_mob = preload("res://Scene/BabyOnion.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_onion()
	spawn_carrot()


func _on_player_health_depleted() -> void:
	%Gameover.visible = true
	get_tree().paused = true
