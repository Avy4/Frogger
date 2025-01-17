extends Path2D

# Variables
@onready var turtle_path_follow: PathFollow2D = $TurtlePathFollow

@export var speed : int = 64
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the progress to the start position
	turtle_path_follow.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Increases the progress by the speed * delta
	turtle_path_follow.progress += round(speed * delta)

# Called if a body enters
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Checks if the body is the Slime
	if (body.name == "Slime"):
		# Calls the set_speed method in the Slime script
		get_tree().call_group("Player", "set_speed", speed)
