extends CharacterBody2D


var speed = 600
var screen_size
var direction

func _ready() -> void:
	direction = [-1, 1].pick_random()

func _process(delta: float) -> void:
	screen_size = get_viewport_rect().size
	
	position.x += direction * speed * delta
	
