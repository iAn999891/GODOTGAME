extends Node2D


func spawn_BabyCarrot():
	var new_mob = preload("res://Scene/BabyCarrot.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_BigCarrot():
	var new_mob = preload("res://Scene/BigCarrot.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_BabyOnion():
	var new_mob = preload("res://Scene/BabyOnion.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_BigOnion():
	var new_mob = preload("res://Scene/BigOnion.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_BabyGrog():
	var new_mob = preload("res://Scene/BabyGrog.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_BigGrog():
	var new_mob = preload("res://Scene/BigGrog.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout() -> void:
	spawn_BabyOnion()
	spawn_BigOnion()
	spawn_BabyCarrot()
	spawn_BigCarrot()
	spawn_BabyGrog()
	spawn_BigGrog()

func _on_player_health_depleted() -> void:
	%Gameover.visible = true
	get_tree().paused = true
