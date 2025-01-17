extends PointLight2D

# Variables
@export var min_light : float = .08
@export var max_light : float = .1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Makes the light flicker by changing it every frame
	texture_scale = randf_range(min_light, max_light)
