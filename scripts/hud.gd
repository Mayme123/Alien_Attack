extends Control

@onready var score = $Score
@onready var lives_left = $LivesLeft

func set_score_label(new_score):
	score.text = "SCORE: " + str(new_score)

func set_lives_label(amount):
	lives_left.text = str(amount)
