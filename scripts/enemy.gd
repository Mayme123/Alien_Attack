extends Area2D

@export var enemy_speed = 180

func _physics_process(delta):
	global_position.x -= enemy_speed * delta
	
func die():
	queue_free()
