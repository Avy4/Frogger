extends Path2D

# Variables
@onready var goblin_path_follow: PathFollow2D = $GoblinPathFollow

@export var speed : int = 150
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the position to the start position (0-1)
	goblin_path_follow.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Increments the progress by speed * delta
	goblin_path_follow.progress += speed * delta
