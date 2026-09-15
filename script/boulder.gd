extends Node2D

@onready var game_manager: Node = get_parent()
@onready var boulder_2: Node2D = $"../boulder2"

var random_boulder_speed = randi_range(40, 45)
var Boulder_1_bottom_hits = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	position.x =randi_range(-110, 160)
	position.y = -100

func _process(delta):
	#print(position.y)
	#position.x =randi_range(-110, 160)
	position.y += random_boulder_speed * delta
	
	
	if position.y > 100:
		#game_manager.add_point()
		position.y = -100
		position.x =randi_range(-110, 160)
		Boulder_1_bottom_hits += 1
		
		if Boulder_1_bottom_hits >=1:
			boulder_2.visible = true
			boulder_2.set_process(true)
			#$killzone/CollisionShape2D.disabled = false
		
		#if green_slime_bottom_hits >=2:
			#slime_purple.visible = true
			#slime_purple.set_process(true)
		#$killzone/CollisionShape2D.disabled = false
		#print("purple slime coming")
