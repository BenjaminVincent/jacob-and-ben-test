extends Control




func _on_resume_pressed() -> void:
	print("resume the game")
	get_tree().paused = false
	hide()


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/start.tscn")
