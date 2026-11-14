extends Area2D

var time = 0.0

func _physics_process(delta):
	time += delta
	var sinValue1 = (sin(time * 2) + 1.0) / 2.0
	var sinValue2 = (sin(time * 0.7) + 1.0) / 2.0
	
	if int(round(time))%3 == 0:
		$Sprite1.scale = Vector2(lerp(1.6, 2.5, sinValue1),1.3)
		$Sprite1.skew = lerp(-0.3, 0.3, sinValue2)
		$Sprite1.visible = true
		$Sprite2.visible = false
	else:
		$Sprite2.scale = Vector2(lerp(1.6, 2.5, sinValue1),1.3)
		$Sprite2.skew = lerp(-0.3, 0.3, sinValue2)
		$Sprite1.visible = false
		$Sprite2.visible = true
