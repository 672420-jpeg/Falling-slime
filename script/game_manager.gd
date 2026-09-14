extends Node

var score = 0

@onready var scorelabel = $Scorelabel
@onready var boulder_5: Node2D = $boulder5
@onready var boulder_4: Node2D = $boulder4
@onready var boulder_3: Node2D = $boulder3
@onready var boulder_2: Node2D = $boulder2
@onready var boulder: Node2D = $boulder

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

var survival_time = 0.0
var spawn_interval = 10
var spawn_amount = 0
var survival_point = 0

@onready var survival_timer: Timer = $SurvivalTimer
@onready var spawn_timer: Timer = $SpawnTimer

func _on_survival_timer_timeout():
	survival_time += 1
	
	
func _ready():
	spawn_positions.shuffle()
	$boulder.position = spawn_positions[0]
	$boulder2.position = spawn_positions[1]
	$boulder3.position = spawn_positions[2]
	$boulder4.position = spawn_positions[3]
	$boulder5.position = spawn_positions[4]

#func _process(delta):
	#survival_time += delta

	# Increase the number of slimes every 10 seconds
	#spawn_amount = 1 + int(survival_time / 10)

	# Make slimes spawn faster over time
	#spawn_interval = max(0.5, 2.0 - survival_time / 30.0)


func add_point():
	#score += 1
	#scorelabel.text = str(score)
	score += 1
	scorelabel.text = ("You've survived " + str(score) + " seconds")
	print(score)

#func spawn_enemies():
	#while true:

		#for i in range(spawn_amount):

			#if slime_scene == null:
				#print("slime scene is missing!")
				#return

			#var slime = slime_scene.instantiate()

			#var random_x = randf_range(
				#$LeftSpawn.position.x,
				#$RightSpawn.position.x
			#)

			#slime.position = Vector2(random_x, 502)

			#add_child(slime)

		#await get_tree().create_timer(spawn_interval).timeout
		

#func _ready():
	#spawn_enemies()
