extends Node2D

func _ready():
	$Area2D.play()

func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://Levels/TestLevel/Level_t1.tscn")
