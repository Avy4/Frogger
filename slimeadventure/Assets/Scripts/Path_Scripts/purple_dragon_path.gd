extends Path2D

@onready var dragon: PathFollow2D = $PurpleDragonPathFollow

@export var speed : int = 64
@export var start_pos : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dragon.progress_ratio = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	dragon.progress += round(speed * delta)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered")
	if (body.name == "Slime"):
		get_tree().call_group("Player", "set_speed", speed)
