extends Area2D

signal gameStart

func _ready():
	get_tree().paused = true
	
	var time = 0.0
	var keyReleased = true
	
	while true:
		await get_tree().create_timer(0.02).timeout
		time += 0.02
		var sinValue = (sin(time * 6) + 1.0) / 2.0
		$playButton.scale = Vector2(lerp(1.1,1.3 , sinValue), lerp(1.1, 1.3, sinValue))
		if Input.is_key_pressed(KEY_SPACE):
			$playButton.modulate = Color(0.8,0.8,0.8,1.0)
			$playButton.scale = Vector2(1.1,1.1)
			while true:
				if not Input.is_key_pressed(KEY_SPACE):
					break
				else:
					await get_tree().create_timer(0.05).timeout
			visible = false
			Global.gameRunning = true
			get_tree().paused = false
			gameStart.emit()
		
		if Input.is_key_pressed(KEY_L):
			if Global.difficulty == 3 and keyReleased == true:
				Global.difficulty = 1
				keyReleased = false
			elif Global.difficulty < 3 and keyReleased == true:
				Global.difficulty += 1
				keyReleased = false
		if not Input.is_key_pressed(KEY_L):
			keyReleased = true
		
		if Global.difficulty == 1:
			$easyDifficulty.visible = true
			$hardDifficulty.visible = false
			$masterDifficulty.visible = false
		if Global.difficulty == 2:
			$easyDifficulty.visible = false
			$hardDifficulty.visible = true
			$masterDifficulty.visible = false
		if Global.difficulty == 3:
			$easyDifficulty.visible = false
			$hardDifficulty.visible = false
			$masterDifficulty.visible = true
