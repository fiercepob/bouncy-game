extends Label

func _process(delta):
	if Global.difficulty == 1:
		text = "Difficulty: Easy"
	elif Global.difficulty == 2:
		text = "Difficulty: Hard"
	elif Global.difficulty == 3:
		text = "Difficulty: Master"
