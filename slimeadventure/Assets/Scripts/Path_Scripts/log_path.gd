extends Path2D

# Variables
@onready var log_path_follow: PathFollow2D = $LogPathFollow
@onready var _log: Sprite2D = $LogPathFollow/Log

@export var speed : int = 64
@export var start_pos : float = 0
@export var new_scale : float = 1.167

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the progress ration to the start position
	log_path_follow.progress_ratio = start_pos
	
	# Sets the scale of the log to the new_scale
	_log.scale.x = new_scale

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Increases progress by speed * delta
	log_path_follow.progress += round(speed * delta)

# Called when a body enters the log
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Checks if the body is named Slime
	if (body.name == "Slime"):
		# Calls the set_speed method in the Slime script
		get_tree().call_group("Player", "set_speed", speed)
