extends Area2D

var pressedTexture = preload("res://Textures/TileMaps/GreenSpringField/z01_buttonPushed.png")

func on_button_pressed():
	$Sprite.texture = pressedTexture
