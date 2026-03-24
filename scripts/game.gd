extends Node2D


#func _ready() -> void:
	#print("size: ", $ColorRect.size)


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()



func _ready() -> void:
	var screen_size = get_viewport_rect().size
	await get_tree().create_timer(.5).timeout
	await get_tree().process_frame
	
	var ball = load("res://scenes/ball/ball.tscn").instantiate()
	
	ball.position = Vector2(screen_size.x /2, screen_size.y /2)
	
	add_child(ball)
	
	#Start!
