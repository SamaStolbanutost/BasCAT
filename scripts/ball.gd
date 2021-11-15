extends RigidBody2D

func _ready():
	set_bounce(0.75)

func start():
	set_deferred("mode", RigidBody2D.MODE_RIGID)

func stop():
	set_deferred("mode", RigidBody2D.MODE_STATIC)
