extends AnimatedSprite2D

# Variable
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@export var speed: int = 96 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Calls the ray_check() method
	ray_check()
	
	# Increases the position by speed and delta
	position.y += speed * delta

# Checks if the sprite is going to collide so it can switch direction
func ray_check():
	# Checks if the ray is colliding
	if (ray_cast_2d.is_colliding()):
		# Inverts the speed (goes other way)
		speed = -1 * speed
		
		# Flips sprite
		flip_v = !flip_v
		
		# Rotates it by 180 degrees (radians)
		ray_cast_2d.rotate(PI)
