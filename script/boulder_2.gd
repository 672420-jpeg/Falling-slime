extends Area2D

@onready var game_manager: Node = get_parent()
@onready var boulder_2: Area2D = $"."
@onready var boulder_3: Area2D = $"../boulder3"
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
		#position.y = -100
		#position.x =randi_range(-110, 160)
		Boulder_2_bottom_hits += 1
		#print("boulder 2")

		if Boulder_2_bottom_hits >=1:
			boulder_3.visible = true
			boulder_3.set_process(true)
			#$killzone/CollisionShape2D.disabled = false
			
#func _on_body_entered(body: Node2D) -> void:
	#if body.name == "boulder":
		#body.queue_free()
		#print("Boulder collision detected")


func _on_boulder_detector_area_entered(area: Area2D) -> void:
	#print("COLLISION WITH: ", area.name)
	if area.name.begins_with("boulder"):
		
		var old_position = global_position
		#var new_position = game_manager.spawn_positions.pop_back()
		#game_manager.spawn_positions.append(new_position)
		var new_position = game_manager.get_free_spawn_positions(self)
		global_position = new_position
		#print("OLD: ", old_position)
		#print("NEW: ", new_position)
		print("Boulder 2 collision detected. was at ", old_position, " moving to ", new_position)
		#area.get_node("Collision").queue_free()
		#area.get_node("AnimatedSprite2D").queue_free()
