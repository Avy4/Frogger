extends CanvasLayer

# Variables
@onready var pause_menu: CanvasLayer = %PauseMenu

# Called every frame
func _process(delta: float) -> void:
	# Checks if the pause button was pressed ("esc")
	if (Input.is_action_just_pressed("pause")):
		# Pauses the game so nothing moves
		get_tree().paused = true
		
		# Shows the pause menu
		pause_menu.show()

# On resume button pressed
func _on_resume_pressed() -> void:
	# Unpauses the game
	get_tree().paused = false
	
	# Hides the pause menu
	pause_menu.hide()

# Called when the exit to menu button is pressed
func _on_exit_to_menu_pause_pressed() -> void:
	# Unpauses the game
	get_tree().paused = false
	
	# Switches the level to the main menu
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/main_menu.tscn")
