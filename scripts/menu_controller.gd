extends Node

func start_offline():
	global.state = "launch"
	global.mode = "training"
	global.score_left = 0
	global.score_right = 0
	get_tree().change_scene("res://scenes/Gameplay.tscn")

func start_multiplayer():
	global.state = "lobby"
	global.mode = "multiplayer"
	global.score_left = 0
	global.score_right = 0
	get_tree().change_scene("res://scenes/Lobby.tscn")


func selected_button():
	$SelectSound.play()
