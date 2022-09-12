extends Area2D

func play_anim():
	$AnimatedSprite.play("Portal")

func play_flipped_anim():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("Portal")
