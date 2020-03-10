extends Sprite


var vel = Vector2()

var speed = 500

func start_at(rot, pos):
	rotation = rot
	position = pos
	vel = Vector2(speed, 0).rotated(rot)
	
	
func _process(delta):
	position += vel*delta


func _on_lifetime_timeout():
	queue_free()
