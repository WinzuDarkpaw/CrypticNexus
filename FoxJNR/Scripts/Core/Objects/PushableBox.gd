class_name PushableBox
extends KinematicBody2D

# Behandelt das Verhalten von beweglichen Boxen.

# Fallgeschwindigkeit.
var gravity = 4
# Aktuelle Geschwindigkeit der Box.
var boxVelocity = Vector2.ZERO

func _physics_process(delta):
	# Die Geschwindigkeit wird nicht steigen, wenn sich die Box auf dem Boden
	# befindet.
	if is_on_floor():
		boxVelocity.y = 0
	# Befindet sich die Box nicht auf dem Boden, soll diese fallen.
	else:
		boxVelocity.y += gravity
	
	move_and_slide(boxVelocity, Vector2.UP)

# Bewegt die Box, entsprechend des Parameters velocity, auf der X-Achse.
func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2())