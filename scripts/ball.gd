extends CharacterBody2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var speed = 600
var screen_size



func start(_position, direction):
	print("velocity: ", velocity)
	position = _position
	velocity = Vector2(speed * direction, 100)



func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		audio_stream_player.play()
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
