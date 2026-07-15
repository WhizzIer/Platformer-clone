extends Node2D

@onready var player: CharacterBody2D = $"../Player"

@export var spring_strength = 20.0
@export var damping = 0.8
@export var max_distance = 40.0

var follow_velocity = Vector2.ZERO


func _process(delta):
	var target_position = player.global_position
	
	var direction = target_position - global_position
	var distance = direction.length()

	# Nur ziehen, wenn der Abstand groß genug ist
	if distance > max_distance:
		var spring_force = direction * spring_strength
		
		follow_velocity += spring_force * delta
		follow_velocity *= damping
		
		global_position += follow_velocity * delta
	else:
		# leicht abbremsen, wenn er nah genug ist
		follow_velocity *= damping
