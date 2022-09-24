class_name BoxButton
extends Area2D

#
#	SAVED VARIABLES
#
var isPressed

var pressedTexture
var unpressedTexture

func unpress():
	isPressed = 0
	$Sprite.texture = unpressedTexture

func press():
	isPressed = 1
	$Sprite.texture = pressedTexture

func initialize(unpressed, pressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
	unpress()
