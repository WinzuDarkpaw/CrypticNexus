class_name OneTimeButton
extends Area2D

#
#	SAVED VARIABLES
#
var isPressed

var pressedTexture
var unpressedTexture

func reload():
	if isPressed == 1:
		on_press()

func initialize(pressed, unpressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
	start()

func start():
	isPressed = 0
	$Sprite.texture = unpressedTexture

func on_press():
	isPressed = 1
	$Sprite.texture = pressedTexture
