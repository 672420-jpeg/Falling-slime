extends Area2D

@onready var game_manager: Node = get_parent()
@onready var boulder_2: Area2D = $"../boulder2"

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
		#position.y = -100
		#position.x =randi_range(-110, 160)
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
func _on_timer_timeout():
	game_manager.add_point()
	print("second")
	
	
#func _on_body_entered(body: Node2D) -> void:
	#if body.name == "boulder":
		#body.queue_free()
		#print("Boulder collision detected")


func _on_boulder_detector_area_entered(area: Area2D) -> void:
	#print("COLLISION WITH: ", area.name)
	if area.name.begins_with("boulder"):
		
		var old_position = global_position
		#var new_position = game_manager.spawn_positions.pop_back()
		var new_position = game_manager.get_free_spawn_positions()
		global_position = new_position
		#print("OLD: ", old_position)
		#print("NEW: ", new_position)
		print("Boulder collision detected. was at ", old_position, " moving to ", new_position)
		#area.get_node("Collision").queue_free()
		#area.get_node("AnimatedSprite2D").queue_free()
