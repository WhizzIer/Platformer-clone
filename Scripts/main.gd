extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var spawn_point: Marker2D = $CurrentLevel/Level01/Gameplay/SpawnPoint
@onready var camera: Camera2D = $Player/Camera






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.global_position = spawn_point.global_position
	camera.reset_smoothing()
	$FollowerNode.snap_to_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
