extends Area2D

#var pressedTexture = preload("res://Textures/TileMaps/GreenSpringField/z01_buttonPushed.png")
var pressedTexture
var unpressedTexture

func on_load():
	$Sprite.texture = unpressedTexture

func on_button_pressed():
	$Sprite.texture = pressedTexture

func set_textures(pressed, unpressed):
	pressedTexture = load(pressed)
	unpressedTexture = load(unpressed)
