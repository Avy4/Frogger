extends CanvasLayer

# Variable
@onready var score: Label = $Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the score text (250 * each life remaining)
	score.text = "Score: " + str(GlobalVars.points + 250 * GlobalVars.lives)

# Called when the return to menu cake button is pressed
func _on_cake_button_pressed() -> void:
	# Changes the scene to main menu
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/main_menu.tscn")
