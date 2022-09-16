extends Area2D

var pressedTexture
var unpressedTexture

func on_button_unpress():
	$Sprite.texture = unpressedTexture

func on_button_pressed():
	$Sprite.texture = pressedTexture

func set_textures(unpressed, pressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
