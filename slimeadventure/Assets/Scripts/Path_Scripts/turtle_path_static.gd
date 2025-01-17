extends Path2D

# Variables 
@onready var turtle_path_follow: PathFollow2D = $TurtlePathStaticPathFollow

@export var speed : int = 64
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the progress to the start_pos
	turtle_path_follow.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Increases progress by speed * delta so its smooth
	turtle_path_follow.progress += round(speed * delta)

# If slime enters the body then calls the set_speed method of the Slime
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered")
	if (body.name == "Slime"):
		get_tree().call_group("Player", "set_speed", speed)
