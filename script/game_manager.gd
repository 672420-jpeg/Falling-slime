extends Node

var score = 0

@onready var scorelabel = $Scorelabel



func add_point():
	score +=1
	scorelabel.text = str(score)	
