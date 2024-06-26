extends Control

onready var http : HTTPRequest = $HTTPRequest
onready var username : LineEdit = $Container/VBoxContainer2/Username/LineEdit
onready var password : LineEdit = $Container/VBoxContainer2/Password/LineEdit
onready var confirm : LineEdit = $Container/VBoxContainer2/Confirm/LineEdit
onready var notification : Label = $Container/Notification

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		notification.text = response_body.result.error.message.capitalize()
	else:
		notification.text = "Registration sucessful!"
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://Scenes/Login.tscn")


func _on_RegisterButton_pressed():
		if password.text != confirm.text or username.text.empty() or password.text.empty():
			notification.text = "Invalid password or username"
			return
		Firebase.register(username.text, password.text, http)
		


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Login.tscn")
