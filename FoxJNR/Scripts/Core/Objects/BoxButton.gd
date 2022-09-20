class_name BoxButton
extends Area2D

#
#	SAVED VARIABLES
#
var isPressed

var pressedTexture
var unpressedTexture

func unpress():
	$Sprite.texture = unpressedTexture

func press():
	$Sprite.texture = pressedTexture

func initialize(unpressed, pressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
	unpress()
