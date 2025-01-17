extends AnimatedSprite2D

# Variables
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@export var speed: int = 48 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Calls the ray_check method
	ray_check()
	
	# Changes the position by speed * delta
	position.x += speed * delta

# ray_check method
func ray_check():
	# Checks if the ray is colliding
	if (ray_cast_2d.is_colliding()):
		# Inverts the speed
		speed = -1 * speed
		
		# Flips the sprite 
		flip_h = !flip_h
		
		# Rotates the sprite by 180 degrees (in radians)
		ray_cast_2d.rotate(PI)
