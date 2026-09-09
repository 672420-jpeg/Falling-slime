extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(position.y)
	position.y += 1
	
	if position.y > 100:
		position.y = -100
		position.x =randi_range(-110, 160)
