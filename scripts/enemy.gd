extends Area2D

@export var enemy_speed = 180
signal died

func _physics_process(delta):
	global_position.x -= enemy_speed * delta
	
func die():
	queue_free()
	emit_signal("died")

func _on_body_entered(body):
	body.take_damage()
	die()
