extends Node2D



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/game_scene.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_characters_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/character_menu.tscn")
