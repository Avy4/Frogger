extends Node2D

# Variable
@onready var animation_player: AnimationPlayer = $GokuSprite/AnimationPlayer
@onready var energy_ball : PackedScene = preload("res://Assets/Scenes/Characters/energy_ball.tscn")

# Is called whenever an animation finishes
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	# If the animation that just ended was idle
	if (anim_name == "idle"):
		# Plays the blast animation
		animation_player.play("blast")
	
	# If the animation that just ended was blast
	elif (anim_name == "blast"):
		# Makes one energy ball
		add_child(energy_ball.instantiate())
		
		# Waits a bit to make another energy ball
		await get_tree().create_timer(.15).timeout
		
		# Makes energy ball 2
		add_child(energy_ball.instantiate())
		
		# Sets animation to idle
		animation_player.play("idle")
