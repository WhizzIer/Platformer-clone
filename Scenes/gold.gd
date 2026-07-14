extends Area2D

@onready var pickup_animation: AnimationPlayer = $"Pickup Animation"
@onready var respawn_timer: Timer = $RespawnTimer
@onready var collision: CollisionShape2D = $CollisionShape2D

#startet den RespawnTimer
func respawn_timer_start() -> void:
	visible = false
	respawn_timer.start()
	

# Merkt, dass Spieler das Gold einsammelt
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("collect_gold"):
		pickup_animation.play("Pickup Animation")
		body.collect_gold()
		collision.set_deferred("disabled", true)

# Respawn Timer endet
func _on_respawn_timer_timeout() -> void:
	visible = true
	collision.set_deferred("disabled", false)
