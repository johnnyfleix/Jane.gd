extends KinematicBody2D

var Velocity = Vector2(0,0)
const Speed = 100
var Gravity = 35
var New_G = 400
const Jump = -600
const Super_Jump = -900

func move():
	if Input.is_action_pressed("move_right"):
		Velocity.x = Speed
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		Velocity.x = -Speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("air")
		
	if Input.is_action_just_pressed("hop") and is_on_floor():
		Velocity.y = Jump
	
	if Input.is_action_pressed("super") and Input.is_action_pressed("hop") and is_on_floor():
		Velocity.y = Super_Jump
		

func _process(delta):
	Velocity.y += Gravity
	if Velocity.y > 600:
		Velocity.y = New_G
	move()
	move_and_slide(Velocity,Vector2.UP)
	Velocity.x = lerp(Velocity.x, 0, 0.2)
