extends CharacterBody2D


var speed = 600
var screen_size

#func _ready() -> void:
	#direction = [-1, 1].pick_random()
#
#func _process(delta: float) -> void:
	#screen_size = get_viewport_rect().size
	#
	#position.x += direction * speed * delta
	#



func start(_position, direction):
	print("velocity: ", velocity)
	position = _position
	#velocity = Vector2(speed, 0).rotated(rotation)
	velocity = Vector2(speed * direction, 100)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
