extends KinematicBody2D


var motion = Vector2()
var speed = 200
var gravity = 10
var jump = 400
var up = Vector2(0, -1)


func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		get_node("AnimatedSprite").flip_h = false
		get_node("AnimatedSprite").play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		get_node("AnimatedSprite").flip_h = true
		get_node("AnimatedSprite").play("run")
	else:
		get_node("AnimatedSprite").play("idle")
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -jump
	else:
		#print("ist in luft")
		get_node("AnimatedSprite").play("jump")
		
	
		
	motion = move_and_slide(motion, up)
	pass
