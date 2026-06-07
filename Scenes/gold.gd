extends Area2D

@onready var pickup_animation: AnimationPlayer = $"Pickup Animation"



func _on_body_entered(body: Node2D) -> void:
	pickup_animation.play("Pickup Animation")
	if body.has_method("collect_gold"):
		body.collect_gold()
