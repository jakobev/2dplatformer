extends KinematicBody2D


var motion = Vector2()
var acc = 50
var gravity = 10
var jump = 400
var up = Vector2(0, -1)
var test = 10
var max_speed = 200


func _physics_process(delta):
	var friction = false
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + acc, max_speed)
		get_node("AnimatedSprite").flip_h = false
		get_node("AnimatedSprite").play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - acc, -max_speed)
		get_node("AnimatedSprite").flip_h = true
		get_node("AnimatedSprite").play("run")
	else:
		print("Im idle zustand")
		get_node("AnimatedSprite").play("idle")
		friction = true
		
	
	if is_on_floor():
		print("is on floor")
		if Input.is_action_pressed("ui_up"):
			motion.y = -jump
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		print("ist in luft ?!?!?!")
		if motion.y < 0:
			get_node("AnimatedSprite").play("jump")
		else:
			get_node("AnimatedSprite").play("fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	
		
	motion = move_and_slide(motion, up)
	pass
