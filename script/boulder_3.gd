extends Area2D

@onready var game_manager: Node = get_parent()
@onready var boulder_3: Area2D = $"."
@onready var boulder_4: Area2D = $"../boulder4"
var random_boulder_speed = randi_range(40, 45)
var Boulder_3_bottom_hits = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x =randi_range(-110, 160)
	position.y = -100
	set_process(false)
	boulder_3.visible = false
	#$killzone/CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	position.y += random_boulder_speed * delta
	
	
	if position.y > 100:
		#game_manager.add_point()
		#position.y = -100
		#position.x =randi_range(-110, 160)
		Boulder_3_bottom_hits += 1
		#print("boulder 3")

		if Boulder_3_bottom_hits >=1:
			boulder_4.visible = true
			boulder_4.set_process(true)
			#$killzone/CollisionShape2D.disabled = false
			
#func _on_body_entered(body: Node2D) -> void:
#	if body.name == "boulder":
		#body.queue_free()
		#print("Boulder collision detected")


func _on_area_entered(area: Area2D) -> void:
	print("COLLISION WITH: ", area.name)
	if area.name =="BoulderCollision":
		global_position = game_manager.spawn_positions.pick_random()
		print("Boulder 3 collision detected. was at ", global_position, " moving to ", game_manager.spawn_positions.pick_random())
		#area.get_node("CollisionShape2D").queue_free()
		#area.get_node("AnimatedSprite2D").queue_free()
