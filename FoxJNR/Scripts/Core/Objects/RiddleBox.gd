class_name RiddleBox
extends KinematicBody2D

#
#	SAVED VARIABLES
#
var posX
var posY

# Laden eines Spielerobjekts.
var obj = load("res://Scripts/Core/Objects/Player.gd")

var boxTexture
var isThrowable = false
var stdPosX = 0
var stdPosY = 0

# Fallgeschwindigkeit.
var gravity = 4
# Aktuelle Geschwindigkeit der Box.
var boxVelocity = Vector2.ZERO

func initialize(texture, x, y):
	boxTexture = load(texture)
	$Sprite.texture = boxTexture
	stdPosX = x
	stdPosY = y

func _physics_process(delta):
	# Die Geschwindigkeit wird nicht steigen, wenn sich die Box auf dem Boden
	# befindet.
	if is_on_floor():
		boxVelocity.y = 0
	if isThrowable and Input.is_action_just_pressed("Interact"):
		boxVelocity.y -= 160
	# Befindet sich die Box nicht auf dem Boden, soll diese fallen.
	else:
		boxVelocity.y += gravity
	
	move_and_slide(boxVelocity, Vector2.UP)

# Bewegt die Box, entsprechend des Parameters velocity, auf der X-Achse.
func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2())

func set_texture(texture):
	boxTexture = load(texture)
	$Sprite.texture = boxTexture

func _on_InteractableIndicator_body_entered(body):
	if body is obj:
		isThrowable = true

func _on_InteractableIndicator_body_exited(body):
	if body is obj:
		isThrowable = false


