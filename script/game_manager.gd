extends Node

var score = 0

@onready var scorelabel = $Scorelabel
@onready var boulder_5: Node2D = $boulder5
@onready var boulder_4: Node2D = $boulder4
@onready var boulder_3: Node2D = $boulder3
@onready var boulder_2: Node2D = $boulder2
@onready var boulder: Node2D = $boulder
@onready var game_manager: Node = %"Game manager"
#var slime_scene = preload("res://scene/boulder.tscn")
#var boulder_scene = preload("res://scene/boulder.tscn")
#var boulder_scene_2 = preload("res://scene/boulder_2.tscn")
#var boulder_scene_3 = preload("res://scene/boulder_3.tscn")
#var boulder_scene_4 = preload("res://scene/boulder_4.tscn")
#var boulder_scene_5 = preload("res://scene/boulder_5.tscn")


var spawn_positions = [
	Vector2(-60, -100),
	Vector2(140, -100),
	Vector2(100, -100),
	Vector2(70, -100),
	Vector2(40, -100),
	Vector2(-10, -100),
	Vector2(-90, -100),
	Vector2(-55, -100),
	Vector2(120, -100),
	Vector2(155, -100),
]
var selected_positions = []
var survival_time = 0.0
var spawn_interval = 10
var spawn_amount = 0
var survival_point = 0
var boulder_count = 1

@onready var survival_timer: Timer = $SurvivalTimer
@onready var spawn_timer: Timer = $SpawnTimer

#func _on_survival_timer_timeout():
	#survival_time += 1
	
	
func _ready():
	spawn_positions.shuffle()
	$boulder.position = spawn_positions[0]
	$boulder2.position = spawn_positions[1]
	$boulder3.position = spawn_positions[2]
	$boulder4.position = spawn_positions[3]
	$boulder5.position = spawn_positions[4]
	
	#print("boulder is at ", boulder.position)
	#print("boulder 2 is at ", boulder_2.position)
	#print("boulder 3 is at ", boulder_3.position)
	#print("boulder 4 is at ", boulder_4.position)
	#print("boulder 5 is at ", boulder_5.position)
	

	
	#if boulder_count == 1 and $boulder.position.y > 100:
	#	boulder_count = 2
	#elif boulder_count == 2 and $boulder2.position.y > 100:
	#	boulder_count = 3
	#elif boulder_count == 3 and $boulder3.position.y > 100:
	#	boulder_count = 4
	#elif boulder_count == 4 and $boulder4.position.y > 100:
	#	boulder_count = 5

func _process(_delta):
	#print("Boulder is at " + str($boulder.position))
	#print("Boulder 2 is at " + str($boulder2.position))
	#print("Boulder 3 is at " + str($boulder3.position))
	#print("Boulder 4 is at " + str($boulder4.position))
	#print("Boulder 5 is at " + str($boulder5.position))
	if boulder_count == 1 \
	and $boulder.position.y > 100:
		#while 
		#spawn_positions.shuffle() 
		#selected_positions = spawn_positions
		#selected_positions[0].push($boulder.position)
		$boulder.position = spawn_positions[0]
		print("boulder is at ", boulder.position)
		print("boulder 2 is at ", boulder_2.position)
		print("boulder 3 is at ", boulder_3.position)
		print("boulder 4 is at ", boulder_4.position)
		print("boulder 5 is at ", boulder_5.position)
		boulder_count = 2
	
	if (
	 boulder_count == 2 
	and boulder.position.y > 100 
	and $boulder2.position.y > 100 
	):
	
		spawn_positions.shuffle()
		$boulder.position = spawn_positions[0]
		$boulder2.position = spawn_positions[1]
		print("boulder is at ", boulder.position)
		print("boulder 2 is at ", boulder_2.position)
		print("boulder 3 is at ", boulder_3.position)
		print("boulder 4 is at ", boulder_4.position)
		print("boulder 5 is at ", boulder_5.position)
		boulder_count = 3
	
	if boulder_count == 3 \
	and $boulder.position.y > 100 \
	and $boulder2.position.y > 100 \
	and $boulder3.position.y > 100:
	
		spawn_positions.shuffle()
		$boulder.position = spawn_positions[0]
		$boulder2.position = spawn_positions[1]
		$boulder3.position = spawn_positions[2]
		print("boulder is at ", boulder.position)
		print("boulder 2 is at ", boulder_2.position)
		print("boulder 3 is at ", boulder_3.position)
		print("boulder 4 is at ", boulder_4.position)
		print("boulder 5 is at ", boulder_5.position)
		boulder_count = 4
	
	if boulder_count == 4 \
	and $boulder.position.y > 100 \
	and $boulder2.position.y > 100 \
	and $boulder3.position.y > 100 \
	and $boulder4.position.y > 100:
	
		spawn_positions.shuffle()
		$boulder.position = spawn_positions[0]
		$boulder2.position = spawn_positions[1]
		$boulder3.position = spawn_positions[2]
		$boulder4.position = spawn_positions[3]
		print("boulder is at ", boulder.position)
		print("boulder 2 is at ", boulder_2.position)
		print("boulder 3 is at ", boulder_3.position)
		print("boulder 4 is at ", boulder_4.position)
		print("boulder 5 is at ", boulder_5.position)
		boulder_count = 5
	
	if (
	boulder_count == 5 
	and $boulder.position.y > 100 
	and $boulder2.position.y > 100 
	and $boulder3.position.y > 100 
	and $boulder4.position.y > 100 
	and $boulder5.position.y > 100
	):
	
		spawn_positions.shuffle()
		$boulder.position = spawn_positions[0]
		$boulder2.position = spawn_positions[1]
		$boulder3.position = spawn_positions[2]
		$boulder4.position = spawn_positions[3]

		$boulder5.position = spawn_positions[4]
		print("boulder is at ", boulder.position)
		print("boulder 2 is at ", boulder_2.position)
		print("boulder 3 is at ", boulder_3.position)
		print("boulder 4 is at ", boulder_4.position)
		print("boulder 5 is at ", boulder_5.position)
	
	#survival_time += delta

	# Increase the number of slimes every 10 seconds
	#spawn_amount = 1 + int(survival_time / 10)

	# Make slimes spawn faster over time
	#spawn_interval = max(0.5, 2.0 - survival_time / 30.0)
func get_free_spawn_positions(exclude_boulder: Node2D) -> Vector2:
	var available_positions = spawn_positions.duplicate()
	available_positions.shuffle()
	for spawn_position in available_positions:
		
		if exclude_boulder != boulder and spawn_position.distance_to(boulder.global_position) <= 40:
			continue
		
		if exclude_boulder != boulder_2 and spawn_position.distance_to(boulder_2.global_position) <= 40:
			continue
		
		if exclude_boulder != boulder_3 and spawn_position.distance_to(boulder_3.global_position) <= 40:
			continue
		
		if exclude_boulder != boulder_4 and spawn_position.distance_to(boulder_4.global_position) <= 40:
			continue
		
		if exclude_boulder != boulder_5 and spawn_position.distance_to(boulder_5.global_position) <= 40:
			continue
		
		return spawn_position
	
	return available_positions[0]

func add_point():
	#score += 1
	#scorelabel.text = str(score)
	score += 1
	scorelabel.text = ("You've survived " + str(score) + " seconds")
	#print(score)

#func spawn_enemies():
	#while true:
#
		#for i in range(spawn_amount):
#
			##if boulder_scene == null:
				##print("bouler scene is missing!")
				##return
##
			##var boulder = boulder_scene.instantiate()
#
			#var random_x = randf_range(
				#$LeftSpawn.position.x,
				#$RightSpawn.position.x
			#)
#
			#boulder.position = Vector2(random_x, 502)
#
			#add_child(boulder)
#
		#await get_tree().create_timer(spawn_interval).timeout
		#
#
#func _enemies():
	#spawn_enemies()
