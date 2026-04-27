extends Area2D

@onready var pickup_animation: AnimationPlayer = $"Pickup Animation"


func _on_body_entered(body: Node2D) -> void:
	print("Hi")
	
	pickup_animation.play("Pickup Animation")
	
