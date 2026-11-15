extends CharacterBody2D

signal gameEnd

var jumps = 0
var xVel = 0
var yVel = 0
var drag = 0.96
var gravity = 0.5

var playerSpeed = 0.6
var bounceStrength = 16.5
var wallBounceStrength = 20
var jumpStrength = 14
var releasedJump = true

func _ready():
	$Sprite2D.position = Vector2(580, 427)

func _physics_process(delta):
	if Input.is_key_pressed(KEY_A):
		xVel -= playerSpeed
	if Input.is_key_pressed(KEY_D):
		xVel += playerSpeed
	if Input.is_key_pressed(KEY_W) and jumps < 1 and releasedJump:
		yVel = jumpStrength * -1
		jumps += 1
		releasedJump = false
	if not Input.is_key_pressed(KEY_W):
		releasedJump = true
	xVel *= drag 
	yVel += gravity
	
	var velocity = Vector2(xVel,yVel)
	$Sprite2D.rotation += xVel * 0.02
	move_and_collide(velocity)
	
func _on_ground_body_entered(body: Node2D) -> void:
	yVel = bounceStrength * -1
	jumps = 0
func _on_left_wall_body_entered(body: Node2D) -> void:
	xVel = wallBounceStrength
func _on_right_wall_body_entered(body: Node2D) -> void:
	xVel = wallBounceStrength * -1
func _on_lasers_body_entered(body: Node2D) -> void:
	if $"../Lasers/laser".visible:
		Global.gameRunning = false
		gameEnd.emit()
