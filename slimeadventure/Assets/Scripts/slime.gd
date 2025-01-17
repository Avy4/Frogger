extends CharacterBody2D

# Variables
@export var start_pos : Vector2 = Vector2(0,0)

@onready var global_vars = get_node("/root/GlobalVars")
@onready var animated_sprite = $AnimatedSprite2D

const MOVE_DISTANCE = 16
var on_platform = false
var on_water = false
var check = true

# Called when it first enters the tree
func _ready() -> void:
	# Sets the global_vars position to the slimes current position
	global_vars.slime_global_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Checks if you can move or is in the middle of the death animation
	if (check):
		# Calls the move function
		move()
		
		# Calls the water_check function
		water_check()
		
		# Checks if the Slime is on a platform
		if (on_platform):
			# If it is move as the same rate as the platform
			move_and_collide(round(velocity * delta))
		else:
			# If not then snap it to a tile (16x16)
			position.x = round(position.x / 16.0) * 16
		
		# Sets the global_vars position to the slime position
		global_vars.slime_global_pos = global_position

# Move function
func move():
	# Checks if the action is forward
	if (Input.is_action_just_pressed("forward")):
		# Stops the current animation
		animated_sprite.stop()
		
		# Plays the walk animation
		animated_sprite.play("walk")
		
		# Moves forward
		move_and_collide(Vector2(0, -1 * MOVE_DISTANCE))
	
	# Checks if the action is backward
	elif (Input.is_action_just_pressed("backward")):
		# Stops the current animation
		animated_sprite.stop()
		
		# Plays the walk animation
		animated_sprite.play("walk")
		
		# Moves backwards
		move_and_collide(Vector2(0, 1 * MOVE_DISTANCE))
	
	# Checks if the input is left
	elif (Input.is_action_just_pressed("left")):
		# Stops the current antimation
		animated_sprite.stop()
		
		# Plays the left/right animation
		animated_sprite.play("gesture" )
		
		# Moves left
		move_and_collide(Vector2(-1 * MOVE_DISTANCE, 0))
		
		# Flips the slime so orientation is correct
		animated_sprite.flip_h = false
	
	# Checks if the input is right
	elif (Input.is_action_just_pressed("right")):
		# Stops the current antimation
		animated_sprite.stop()
		
		# Plays the left/right animation
		animated_sprite.play("gesture")
		
		# Moves left
		move_and_collide(Vector2(1 * MOVE_DISTANCE, 0))
		
		# Flips the slime so orientation is correct
		animated_sprite.flip_h = true

# Called upon slime area entered
func _on_area_2d_area_entered(area: Area2D) -> void:
	# If the collision is with 16 (floating i.e platforms)
	if (area.collision_layer == 16):
		# Sets on_platform to true
		on_platform = true
	
	# If the collision is with 32 (water/pit)
	if (area.collision_layer == 32):
		# Sets on_water to true
		on_water = true
	
	# If the collision is with 4 (Enemies)
	if (area.collision_layer == 4):
		# Calls reset with 0 (which means lives will be deducted)
		reset(0)
	
	# If the collision is with 8 (Tokens)
	if (area.collision_layer == 8):
		# Calls add_points in the GameManager node
		get_tree().call_group("GameManager", "add_points")

# When the Slime leabes areas
func _on_area_2d_area_exited(area: Area2D) -> void:
	# If the layer is 16 (platform)
	if (area.collision_layer == 16):
		# On platform is set to false
		on_platform = false 
	
	# If the layer is 32 (water)
	if (area.collision_layer == 32):
		# On water is set as false
		on_water = false

# Set speed function
func set_speed(speed: int) -> void:
	# Sets the velocity to the speed of the platform
	velocity = Vector2(-1 * speed, 0)

# Water check function
func water_check():
	# If you are on water and not on a platform
	if (on_water and !(on_platform)):
		# Calls reset with 0 which means lives go by one
		reset(0)

# Reset function
func reset(val: int):
	# If called with a 0
	if (val == 0):
		# Plays the death animation
		animated_sprite.play("death")
		
		# Sets check to false (i.e animation is playing)
		check = false
		
		# On_water is false cause you aren't on water if you're dead
		on_water = false
		
	# If called with 1
	elif (val == 1):
		# Resets the Slime to start position
		position = start_pos

# Called on animation finished
func _on_animated_sprite_2d_animation_finished() -> void:
	# If was death animation
	if (animated_sprite.animation == "death"):
		# Position is set to the start position
		position = start_pos
		
		# Removes 1 life
		global_vars.lives = global_vars.lives - 1
		
		# Check is set to true so you can move again
		check = true
