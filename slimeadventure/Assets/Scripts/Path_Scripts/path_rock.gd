extends Path2D

# Variable
@onready var path_rock : PathFollow2D = $PathFollowRock

@export var speed : int = 96
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the progress ration to the start position
	path_rock.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Increases progress by speed * delta
	path_rock.progress += round(speed * delta)

# Called when a body enters the rock
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Checks if the body is named Slime
	if (body.name == "Slime"):
		# Calls the set_speed method in the Slime script
		get_tree().call_group("Player", "set_speed", speed)
