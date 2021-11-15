extends Node

func cancel_game():
	global.state = "main_menu"
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func menu_as_client():
	$UI/TopText.text = "Client"
	$UI/ChooseMenu.visible = false
	$UI/ClientMenu.visible = true

func menu_as_host():
	$UI/TopText.text = 'Host'
	$UI/ChooseMenu.visible = false
	$UI/HostMenu.visible = true

func selected_button():
	$SelectSound.play()
