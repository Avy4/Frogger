extends Path2D

# Variables
@onready var tree_path_follow: PathFollow2D = $TreePathFollow
@onready var leaves_end: CPUParticles2D = $TreePathFollow/LeavesEnd
@onready var leaves_start: CPUParticles2D = $TreePathFollow/LeavesStart

@export var speed : int = 65
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the starting position
	tree_path_follow.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Increments progress every frame by speed * delta
	tree_path_follow.progress += speed * delta
	
	# Calls the particles method
	particles()

# Method that plays particles
func particles():
	# Checks if the progress is over .95/1
	if (tree_path_follow.progress_ratio > .95):
		# Restarts both particle players (they are both one shot)
		leaves_start.restart()
		leaves_end.restart()
		
		# Sets both to emitting so they play once
		leaves_start.emitting = true
		leaves_end.emitting = true
