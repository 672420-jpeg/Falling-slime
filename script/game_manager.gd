extends Node

var score = 0

@onready var scorelabel = $Scorelabel

var slime_scene = preload("res://scene/boulder.tscn")




var survival_time = 0.0
var spawn_interval = 10
var spawn_amount = 0
var survival_point = 0

@onready var survival_timer: Timer = $SurvivalTimer
@onready var spawn_timer: Timer = $SpawnTimer



func _on_survival_timer_timeout():
	survival_time += 1
	
	



func _process(delta):
	survival_time += delta

	# Increase the number of slimes every 10 seconds
	spawn_amount = 1 + int(survival_time / 10)

	# Make slimes spawn faster over time
	spawn_interval = max(0.5, 2.0 - survival_time / 30.0)


func add_point():
	#score += 1
	#scorelabel.text = str(score)
	score += 1
	scorelabel.text = ("You've survived " + str(score) + " seconds")
	print(score)

func spawn_enemies():
	while true:

		for i in range(spawn_amount):

			if slime_scene == null:
				print("slime scene is missing!")
				return

			var slime = slime_scene.instantiate()

			var random_x = randf_range(
				$LeftSpawn.position.x,
				$RightSpawn.position.x
			)

			slime.position = Vector2(random_x, 502)

			add_child(slime)

		await get_tree().create_timer(spawn_interval).timeout
		

func _ready():
	spawn_enemies()
