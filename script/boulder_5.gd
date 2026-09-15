extends Node2D
@onready var boulder_5: Node2D = $"."
var random_boulder_speed = randi_range(40, 45)
#@onready var boulder_3: Node2D = $"../boulder3"
#var Boulder_2_bottom_hits = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x =randi_range(-110, 160)
	position.y = -100
	set_process(false)
	boulder_5.visible = false
	#$killzone/CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	position.y += random_boulder_speed * delta
	
	
	if position.y > 100:
		#game_manager.add_point()
		#position.y = -100
		#position.x =randi_range(-110, 160)
#Boulder_2_bottom_hits += 1
		print("boulder 5")

#if Boulder_2_bottom_hits >=1:
#boulder_2.visible = true
#boulder_2.set_process(true)
#$killzone/CollisionShape2D.disabled = false
