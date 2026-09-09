extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		print("You died")
		timer.start()
		body.get_node("CollisionShape2D").queue_free()
	


func _on_timer_timeout():
	get_tree().reload_current_scene()
