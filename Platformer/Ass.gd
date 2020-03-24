extends KinematicBody2D

var motion = Vector2()
var speed = 200
var up = Vector2(0, -1)
var counter = 0
var timer
var yAchse = 400
var time
func _physics_process(delta):
	
	motion.y = sin(get_position().x * 2) * 100
	motion.x = -1
	motion = move_and_slide(motion)
