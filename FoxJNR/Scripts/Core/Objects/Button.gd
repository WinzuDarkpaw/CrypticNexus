extends Area2D

var pressedTexture
var unpressedTexture

func on_load():
	$Sprite.texture = unpressedTexture

func on_button_pressed():
	$Sprite.texture = pressedTexture

func set_textures(pressed, unpressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
