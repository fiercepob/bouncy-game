extends Label

func _ready():
	await $"../Menu".gameStart
	var timer = 0.00
	while Global.gameRunning:
		await get_tree().create_timer(0.01).timeout
		timer += 0.01
		text = "Time Survived: " + str(snapped(timer, 0.01))
