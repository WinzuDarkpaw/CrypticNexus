class_name OneTimeButton
extends Area2D

#
#	SAVED VARIABLES
#
var isPressed

var pressedTexture
var unpressedTexture

func initialize(pressed, unpressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
	start()

func start():
	$Sprite.texture = unpressedTexture

func on_press():
	$Sprite.texture = pressedTexture
