extends KinematicBody2D


var motion = Vector2()
var speed = 200
var gravity = 10
var jump = 400
var up = Vector2(0, -1)


func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		get_node("AnimatedSprite").play("run")
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		get_node("AnimatedSprite").flip_h
		get_node("AnimatedSprite").play("run")
		motion.x = -speed
	else:
		get_node("AnimatedSprite").play("idle")
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			get_node("AnimatedSprite").play("jump")
			motion.y = -jump
		else:
			motion.y = 0
		
		
	motion = move_and_slide(motion, up)
	pass
