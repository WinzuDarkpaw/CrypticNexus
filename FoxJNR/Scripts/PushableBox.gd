class_name PushableBox
extends KinematicBody2D

var gravity = 4
var boxVelocity = Vector2.ZERO

func _physics_process(delta):
	if is_on_floor():
		boxVelocity.y = 0
	else:
		boxVelocity.y += gravity
	
	move_and_slide(boxVelocity, Vector2.UP)

func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2())
