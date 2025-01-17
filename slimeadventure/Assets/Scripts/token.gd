extends Node2D

# Variables 
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# If Slime enters the token plays the pickup sound
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Checks if body is Slime
	if (body.name == "Slime"):
		# Plays the pickup sound
		audio_stream_player_2d.play()
		
		# Sets visible to false so it looks like its collected without queue_free()
		visible = false

# Called on the end of the pickup noise
func _on_audio_stream_player_2d_finished() -> void:
	# Removes the token from the scene tree
	queue_free()
