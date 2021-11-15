extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 250
var gravity_const = 80
func _ready():
	pass

func get_input():
	velocity = Vector2.ZERO
	if not is_on_floor():
		velocity.y += gravity_const
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed

func _physics_process(delta):
	if global.state == "game" or global.state == "goal":
		get_input()
		velocity = move_and_slide(velocity)

