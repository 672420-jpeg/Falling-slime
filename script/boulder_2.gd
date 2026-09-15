extends Node2D
@onready var boulder_2: Node2D = $"."
@onready var boulder_3: Node2D = $"../boulder3"
var random_boulder_speed = randi_range(40, 45)
var Boulder_2_bottom_hits = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x =randi_range(-110, 160)
	position.y = -100
	set_process(false)
	boulder_2.visible = false
	#$killzone/CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	position.y += random_boulder_speed * delta
	
	
	if position.y > 100:
		#game_manager.add_point()
		position.y = -100
		position.x =randi_range(-110, 160)
		Boulder_2_bottom_hits += 1
		print("boulder 2")

		if Boulder_2_bottom_hits >=1:
			boulder_3.visible = true
			boulder_3.set_process(true)
			#$killzone/CollisionShape2D.disabled = false
