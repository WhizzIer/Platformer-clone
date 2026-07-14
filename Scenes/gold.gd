extends Area2D

@onready var pickup_animation: AnimationPlayer = $"Pickup Animation"
@onready var respawn_timer: Timer = $RespawnTimer
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var hovering_animation: AnimationPlayer = $"Hovering Animation"
@onready var glow_pulse: AnimationPlayer = $"Glow Pulse"



# Animation an zufälliger Stelle starten
func _ready() -> void:
	var hover_animation = hovering_animation.get_animation("Gold wiggle")
	var random_hover_time = randf_range(0, hover_animation.length)
	hovering_animation.play("Gold wiggle")
	hovering_animation.seek(random_hover_time, true)
	var pulse_animation = glow_pulse.get_animation("Pulse")
	var random_pulse_time = randf_range(0, pulse_animation.length)
	glow_pulse.play("Pulse")
	glow_pulse.seek(random_pulse_time, true)


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
