extends Area2D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump") and $GoalScreen.visible:
		get_tree().reload_current_scene()
		Engine.time_scale = 1


func _on_body_entered(body: Node2D) -> void:
	$GoalScreen.visible = true
	Engine.time_scale = 0.1
