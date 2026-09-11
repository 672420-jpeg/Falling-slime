extends Node2D
@onready var slime_purple: Node2D = $"."
@onready var timer: Timer = $Timer

func _ready():
	position.x =randi_range(-110, 160)
	#et_process(false)
	#slime_purple.visible = false
	$killzone/CollisionShape2D.disabled = true
	#position.x =randi_range(-110, 160)
	
	

@onready var game_manager: Node = %"Game manager"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	position.y += 40 * delta
	
	
	if position.y > 100:
		game_manager.add_point()
		position.y = -100
		position.x =randi_range(-110, 160)
		print("slime_purple")
	


func _on_timer_timeout():
	print("second")
