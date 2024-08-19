extends CharacterBody2D

var move_speed = 350
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2(0,0);
	if Input.is_action_pressed("right"):
		velocity.x = move_speed
	if Input.is_action_pressed("left"):
		velocity.x = -move_speed
	if Input.is_action_pressed("up"):
		velocity.y = -move_speed
	if Input.is_action_pressed("down"):
		velocity.y = move_speed
	
	move_and_slide()
	
	var scree_size = get_viewport_rect().size
	
	global_position = global_position.clamp(Vector2(0,0), scree_size)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
	
