extends Control

var is_paused = false setget set_is_paused
var data_store = []

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_resume_pressed():
	self.is_paused = false

func _on_restart_pressed() -> void:
	self.is_paused = false
	get_tree().reload_current_scene()
	Game.reset_data_store()
	pass

func _on_quit_pressed():
	self.is_paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
