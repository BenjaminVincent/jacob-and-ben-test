extends CharacterBody2D


var speed = 600
var screen_size
var direction

#func _ready() -> void:
	#direction = [-1, 1].pick_random()
#
#func _process(delta: float) -> void:
	#screen_size = get_viewport_rect().size
	#
	#position.x += direction * speed * delta
	#



func start(_position, _direction):
	print("velocity: ", velocity)
	rotation = _direction
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()



func _on_VisibilityNotifier2D_screen_exited():
	#signal to score a point
	queue_free()
