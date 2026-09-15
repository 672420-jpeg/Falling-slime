extends Node2D

@onready var slime_purple: Node2D = $"../Slime_purple"


@onready var game_manager: Node = get_parent()
@onready var slime_purple: Node2D = $"../Slime_purple"
@onready var slime: Node2D = $"."

var green_slime_bottom_hits = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _ready():
	position.x =randi_range(-110, 160)
	
	set_process(false)
	slime.visible = false
	$killzone/CollisionShape2D.disabled = true

func _process(delta):
	#print(position.y)
	#position.x =randi_range(-110, 160)
	position.y += 40 * delta
	
	
	if position.y > 100:
		#game_manager.add_point()
		position.y = -100
		position.x =randi_range(-110, 160)
		green_slime_bottom_hits += 1
		
		
		#if green_slime_bottom_hits >=2:
			#slime_purple.visible = true
			#slime_purple.set_process(true)
		#$killzone/CollisionShape2D.disabled = false
		#print("purple slime coming")
