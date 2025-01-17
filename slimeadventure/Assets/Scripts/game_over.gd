extends CanvasLayer

# Plays when the play again button is pressed
func _on_play_again_pressed() -> void:
	# Switches scene to the first level
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/level_1.tscn")

# Plays when the exit to menu button is pressed
func _on_exit_to_menu_pressed() -> void:
	# Switches to the main menu
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/main_menu.tscn")
