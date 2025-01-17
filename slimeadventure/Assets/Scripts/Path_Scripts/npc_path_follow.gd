extends Path2D

# Variables
@onready var npc_path_follow: PathFollow2D = $NPCPathFollow
@onready var npc: AnimatedSprite2D = $NPCPathFollow/NPC

@export var speed : int = 100
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Random start position
	start_pos = randf_range(0,1)
	
	# Sets the progress ratio to the start_pos
	npc_path_follow.progress_ratio = start_pos
	
	# Gives the npc a random skin
	npc.play(str(randi_range(0, 5)))
	
	# Gives the npc a random speed
	speed = randi_range(35,150)
	
	# If the speed is < 0 then flip the sprite
	if (speed < 0):
		# Flips the npc
		npc.flip_h = !npc.flip_h 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Increases the progress by speed * delta
	npc_path_follow.progress += speed * delta
