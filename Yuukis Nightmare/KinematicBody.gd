extends KinematicBody

var gravity = 0.98

var speed = 10
var up = Vector3(0,-1,0)
var jump = 30
var mouse_sens = 0.3
var velocity = Vector3()
var acc = 5

onready var head = $Head
onready var camera = $Head/Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_z(deg2rad(event.relative.x * mouse_sens))

		camera.rotate_x(deg2rad(-event.relative.y * mouse_sens))
		
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		
func _physics_process(delta):
	
	var head_basis = head.get_global_transform().basis
	var motion = Vector3()
	
	
	velocity.y -= gravity
	
	if Input.is_action_pressed("rechts"):
		motion += head_basis.x
	elif Input.is_action_pressed("links"):
		motion -= head_basis.x
	
		
	if Input.is_action_pressed("zurück"):
		motion += head_basis.y
	elif Input.is_action_pressed("vor"):
		motion -= head_basis.y
	
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump
		
	motion = motion.normalized()
	
	velocity = velocity.linear_interpolate(motion * speed, acc * delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)
