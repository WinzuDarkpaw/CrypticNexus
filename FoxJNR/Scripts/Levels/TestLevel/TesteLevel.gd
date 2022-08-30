extends Node2D

# EXAMPLE CODE
# In dem Game Skript wird die gesamte Logik, die nur das Level betrifft behandelt.
# Zwecks, dass Knöpfe nicht immer das gleiche machen! usw.

onready var game_saver : Node = null

func _ready():
	game_saver = $SaveGame

func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()


func _on_Goal_body_entered(body):
	# ""Szenenwechsel""
	if body is Player:
		get_tree().reload_current_scene()


func _on_Button_body_entered(body):
	if body is Player:
		# Kollision dynamisch einschalten.
		$TileMap2.collision_layer = 1
		$TileMap2.collision_mask = 1
		# Sichtbarkeit einschalten.
		$TileMap2.visible = true


func _on_Rift_body_entered(body):
	get_tree().change_scene("res://Levels/TestLevel/Level_t2.tscn")
