extends Node

# Variables
var lives: int = 3
var points: int = 0
var points_for_life = 1000
var slime_global_pos : Vector2 = Vector2(0,0)

# Called every frame
func _process(_delta: float) -> void:
	# Checks if a life needs to be added (every 1k points)
	if (points > points_for_life):
		# Adds a life
		lives = lives + 1
		
		# Increases threshold for getting another life
		points_for_life += 1000
