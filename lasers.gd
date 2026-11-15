extends Area2D

func _ready():
	await $"../Menu".gameStart
	
	var minInterval = 0
	var maxInterval = 0
	if Global.difficulty == 1:
		minInterval = 1
		maxInterval = 3
	elif Global.difficulty == 2:
		minInterval = 1
		maxInterval = 1
	var xPos = 0
	var yPos = 0
	var heatInterval = 1
	if Global.difficulty == 1:
		heatInterval = 1.3
	elif Global.difficulty == 2:
		heatInterval = 1
	else:
		heatInterval = 0.6
	var direction = "a"
	var laserLifetime = 0.4
	if Global.difficulty == 3:
		laserLifetime = 0.7
	
	while not get_tree().paused:
		await get_tree().create_timer(randi_range(minInterval,maxInterval)).timeout
		var i = randi_range(0,5)
		if i > 2:
			xPos = randi_range(100,1090)
			yPos = 50
			direction = "top"
		else:
			if i == 1:
				xPos = 1100
				direction = "right"
			else:
				xPos = 50
				direction = "left"
			yPos = randi_range(100, 475)
		
		rotation = 0.0
		position = Vector2(xPos, yPos)
		$warning.modulate = Color(0.25,0.75,0.25,1.0)
		$warning.visible = true
		if direction == "top":
			$arrow.rotation_degrees = 90.0
			$arrow.position = Vector2(0, 70)
		elif direction == "left":
			$arrow.rotation_degrees = 0.0
			$arrow.position = Vector2(70, 0)
		else:
			$arrow.rotation_degrees = 180.0
			$arrow.position = Vector2(-70, 0)
		$arrow.visible = true
		await get_tree().create_timer(heatInterval).timeout
		$warning.modulate = Color(1.0, 0.76, 0.14, 1.0)
		await get_tree().create_timer(heatInterval).timeout
		$warning.modulate = Color(1.0, 0.349, 0.0, 1.0)
		await get_tree().create_timer(heatInterval).timeout
		$warning.modulate = Color(1.0, 0.0, 0.0, 1.0)
		await get_tree().create_timer(heatInterval).timeout
		$warning.visible = false
		$arrow.visible = false
		
		if direction == "top":
			rotation_degrees = 90.0
			$laser.flip_h = false
			position = Vector2(xPos, 576)
		elif direction == "left":
			rotation = 0.0
			$laser.flip_h = false
			position = Vector2(580, yPos)
		elif direction == "right":
			rotation = 0.0
			$laser.flip_h = true
			position = Vector2(580, yPos)
		$laser.visible = true
		await get_tree().create_timer(laserLifetime).timeout
		$laser.visible = false
