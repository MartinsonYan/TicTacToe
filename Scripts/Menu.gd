extends Control


func _on_PlayGame_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_QuitGame_pressed():
	get_tree().quit()

