extends CharacterBody2D


var speed = 300



func _ready() -> void:
	pass
	
	
func _process(delta) -> void:
	var p1_dir = Input.get_vector("ui_left", "ui_right", "P1_UP", "P1_DOWN")
	var p2_dir = Input.get_vector("ui_left", "ui_right", "P2_UP", "P2_DOWN")
	
	# Apply movement (for Node2D)
	if name == "P1": 
		position.y += p1_dir.y * speed * delta
	#print("direction is: ", direction)

	if name == "P2": 
		position.y += p2_dir.y * speed * delta
