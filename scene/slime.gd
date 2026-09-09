extends Node2D

@onready var game_manager: Node = %"Game manager"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	position.y += 1
	
	if position.y > 100:
		game_manager.add_point()
		position.y = -100
		position.x =randi_range(-110, 160)
