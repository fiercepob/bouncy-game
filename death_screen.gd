extends Sprite2D

func _ready():
	await $"../Player".gameEnd
	visible = true
	$scoreDisplay.text = str(snapped(Global.gameScore, 0.01))
	$scoreDisplay.visible = true

var gameEnded = false
func _on_player_game_end() -> void:
		gameEnded = true
func _process(delta):
	if gameEnded:
		if Input.is_key_pressed(KEY_L):
				get_tree().reload_current_scene()
