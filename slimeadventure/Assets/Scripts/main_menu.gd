extends CanvasLayer

# Variable
@export var music_to_play : AudioStream

# Played when tree is entered
func _ready() -> void:
	# Switches the Bgm to the main menu music
	Bgm.stream = music_to_play
	# Plays the main meny song
	Bgm.play()

# Played when the start button is pressed
func _on_start_button_pressed() -> void:
	# Changes the scene to level 1
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/level_1.tscn")
