extends Path2D

# Variables
@onready var minecart_path_follow: PathFollow2D = $MinecartPathFollow

@export var speed : int = 200
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the progress ration to the start position
	minecart_path_follow.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Increases progress by speed * delta
	minecart_path_follow.progress += speed * delta
