extends Node2D

# Variables
@onready var global_vars = get_node("/root/GlobalVars")

const SPEED = 300
var move_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sets the position that the ball moves towards as the slimes global pos
	move_position = global_vars.slime_global_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Moves towards the move_position by speed * delta
	global_position = global_position.move_toward(move_position, SPEED * delta)
	
	# If the ball reaches the position then it deletes itself
	if (global_position == move_position):
		queue_free()

# Called on timer timeout
func _on_timer_timeout() -> void:
	# Failsafe for deleting the ball if for some reason the other check doen't catch it
	queue_free()
