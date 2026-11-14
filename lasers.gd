extends Area2D

func _ready():
	var minInterval = 1
	var maxInterval = 1
	var xPos = 0
	var yPos = 0
	var timeToNextStage = 1
	var direction = "a"
	while true:
		await get_tree().create_timer(randi_range(minInterval,maxInterval)).timeout
		var i = randi_range(0,5)
		if i < 2:
			xPos = randi_range(100,1090)
			yPos = 50
			direction = "vertical"
		else:
			xPos = 50
			yPos = randi_range(100, 475)
			direction = "horizontal"
		$chill.position = Vector2(xPos,yPos)
		$chill.visible = true
		print("test")
		
