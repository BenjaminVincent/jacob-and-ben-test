extends CharacterBody2D

var speed = 400

var screen_size

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _process(delta) -> void:
	
	screen_size = get_viewport_rect().size
	
	var p1_dir = Input.get_vector("ui_left", "ui_right", "P1_UP", "P1_DOWN")
	var p2_dir = Input.get_vector("ui_left", "ui_right", "P2_UP", "P2_DOWN")
	
	if name == "P1":
		position.y += p1_dir.y * speed * delta

	if name == "P2":
		position.y += p2_dir.y * speed * delta

	position.y = clamp(position.y, 0, screen_size.y - collision_shape_2d.shape.size.y)
