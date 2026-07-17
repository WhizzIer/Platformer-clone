extends Path2D

@export var speed := 0.2

@onready var platform_path: PathFollow2D = $PlatformPath

var forwardDirection = 1

func _physics_process(delta: float) -> void:
	platform_path.progress_ratio += speed * delta * forwardDirection
	
	if forwardDirection == 1 and platform_path.progress_ratio == 1:
		forwardDirection = -1
	elif forwardDirection == -1 and platform_path.progress_ratio == 0:
		forwardDirection = 1
