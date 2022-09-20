class_name Portal
extends Area2D

func play():
	$AnimatedSprite.play("Portal")

func play_flipped():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Portal")
