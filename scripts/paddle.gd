extends CharacterBody2D

var speed = 400

var screen_size

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



func get_input():
	var p1_input = Input.get_vector("ui_left", "ui_right", "P1_UP", "P1_DOWN")
	var p2_input = Input.get_vector("ui_left", "ui_right", "P2_UP", "P2_DOWN")
	
	var input_dir = null
	if name == "P1":
		input_dir = p1_input
	else:
		input_dir = p2_input
	
	velocity = input_dir * speed



func _physics_process(delta):
	
	get_input()
	
	move_and_collide(velocity * delta)
	
	var rect = get_viewport_rect()
	
	global_position = global_position.clamp(rect.position, rect.end - collision_shape_2d.shape.size)
