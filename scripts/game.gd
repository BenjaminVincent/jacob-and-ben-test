extends Node2D

@onready var p_1_score: Label = $UI/P1Score
@onready var p_2_score: Label = $UI/P2Score
@onready var screen_size = get_viewport_rect().size

#func _ready() -> void:
	#print("size: ", $ColorRect.size)
var ball

var p1_score = 0
var p2_score = 0

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()



func _ready() -> void:
	
	ball = load("res://scenes/ball/ball.tscn").instantiate()
	
	ball.position = Vector2(screen_size.x /2, screen_size.y /2)
	
	add_child(ball)
	
	reset_ball([-1, 1].pick_random())
	
	#Start!
	



func _physics_process(_delta: float) -> void:
	
	if ball:
		if ball.position.x < 0:
			update_score("p2")
			reset_ball(1)
		if ball.position.x > get_viewport_rect().size.x:
			update_score("p1")
			reset_ball(-1)



func update_score(player_score) -> void:
	
	match player_score:
		"p1":
			p1_score += 1
			p_1_score.text = str(p1_score)
		"p2":
			p2_score += 1
			p_2_score.text = str(p2_score)
			


func reset_ball(start_direction) -> void:
	
	ball.velocity = Vector2.ZERO
	ball.position = Vector2(screen_size.x /2, screen_size.y /2)
	
	await get_tree().create_timer(1.0).timeout
	await get_tree().process_frame
	
	ball.start(ball.position, start_direction)
	
