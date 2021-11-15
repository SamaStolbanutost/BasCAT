extends Node

signal start
signal stop
var timer = 0.0
var num = 1

func _ready():
	$UI/Text/Score.text = str(global.score_left) + " : " + str(global.score_right)

func goal(body, side):
	if body.is_in_group("ball") and global.state == "game":
		
		$UI/Text/Ready.text = "Score!"
		$UI/Text/Ready.visible = true
		timer = 0
		global.state = "goal"
		if side == "left":
			global.score_right += 1
		elif side == "right":
			global.score_left += 1
		$GoalSound.play()

func count():
	if timer >= 1.0 and global.state == "launch":
		timer = 0
		$UI/Text/Ready.text = str(3 - num) + ".."
		num += 1
		if num == 4:
			num = 5
			emit_signal("start")
			global.state = "game"
			$UI/Text/Ready.visible = false
			$StartSound.play()
			
		else:
			$CountSound.play()
	
	if timer >= 1.0 and global.state == "goal":
		global.state = "launch"
		get_tree().reload_current_scene()

func _physics_process(delta):
	timer += delta
	count()
	
func ball_collided(body):
	$KickSound.play()

func home():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func selected_button():
	$SelectSound.play()
