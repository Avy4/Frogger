extends Node

# Variables
@onready var global_vars = get_node("/root/GlobalVars")
@onready var pre_slime_core_sprite : PackedScene = preload("res://Assets/Scenes/Additions/slime_core.tscn")
@onready var heart_container: HBoxContainer = $GUI/HeartContainer
@onready var score_label: Label = $GUI/ScoreLabel
@onready var time_remaining: TextureProgressBar = $GUI/TimeRemaining

@export var scene_next : PackedScene
@export var music_to_play : AudioStream
@export var level_one : bool

var token_counter : int = 4
const timer_time : int = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Checks if the level is the first level
	if (level_one):
		# Resets global_vars to the defaults
		global_vars.lives = 3
		global_vars.points = 0
	
	# Adds hearts based on how many lives the player has
	for life in global_vars.lives:
		# Adds a heart
		heart_container.add_child(pre_slime_core_sprite.instantiate())
	
	# Sets the score_label to the global_vars.points
	score_label.text = str(global_vars.points)
	
	# Sets the Bgm to the correct bgm
	Bgm.stream = music_to_play
	Bgm.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Gets the amount of children (amount of hearts)
	var child_count = heart_container.get_child_count()
	
	# If time hits 0 
	if (time_remaining.value == 0):
		# Reset the player (remove a life as well) (calling with 0)
		get_tree().call_group("Player", "reset", 0)
		
		# Resets the timer_time
		time_remaining.value = timer_time
	
	# If you have less lives than children
	if (global_vars.lives < child_count):
		# If you have 0 lives
		if (global_vars.lives == 0):
			# Change scene to game over
			get_tree().change_scene_to_file("res://Assets/Scenes/Levels/game_over.tscn")
		else:
			# Get reference to a heart
			var heart = heart_container.get_child(0)
			
			# Reset the timer
			time_remaining.value = timer_time
			
			# Delete the heart 
			heart.queue_free()
		
	# If there are more lives than children
	elif (global_vars.lives > child_count):
		# Add a heart
		heart_container.add_child(pre_slime_core_sprite.instantiate())
	
	# If there are no more tokens go to the next scene
	if (token_counter == 0):
		get_tree().change_scene_to_packed(scene_next)

# Add points method
func add_points() -> void:
	# Adds 100 points
	global_vars.points += 100
	
	# Adds remaining time * 10 points (max 300 but not really)
	global_vars.points += time_remaining.value * 10
	
	# Reset the timer
	time_remaining.value = timer_time
	
	# Update score text
	score_label.text = str(global_vars.points)
	
	# Remove one token
	token_counter -= 1
	
	# Reset the player with 1 (all it does it just revert position)
	get_tree().call_group("Player", "reset", 1)

# On timer timeout
func _on_sec_timer_timeout() -> void:
	# Reduce the progress bar value by 1
	time_remaining.value -= 1
