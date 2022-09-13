extends Node2D

# EXAMPLE CODE
# In dem Game Skript wird die gesamte Logik, die nur das Level betrifft behandelt.
# Zwecks, dass Knöpfe nicht immer das gleiche machen! usw.

func _ready():
	$Button.set_textures("res://Textures/TileMaps/GreenSpringField/z01_buttonPushed.png", "res://Textures/TileMaps/GreenSpringField/z01_button.png")
	$Button.on_load()
	$PortalLeft.play_flipped_anim()
	$PortalRight.play_anim()
	$Water.play_anim()
	$PushableBox.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png")
	$BoxButton.set_textures("res://Textures/TileMaps/GreenSpringField/z06_boxButton.png", "res://Textures/TileMaps/GreenSpringField/z06_boxButton_lit.png")
	$BoxButton.on_button_unpress()

func _process(delta):
	print(Engine.get_frames_per_second())

func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()

func _on_Button_body_entered(body):
	if body is Player:
		# Kollision dynamisch einschalten.
		$TileMap2.collision_layer = 1
		$TileMap2.collision_mask = 1
		# Sichtbarkeit einschalten.
		$TileMap2.visible = true
		$Button.on_button_pressed()

func _on_BoxButton_body_entered(body):
	if body == $PushableBox:
		# weitere Logik
		$BoxButton.on_button_pressed()


func _on_BoxButton_body_exited(body):
	if body == $PushableBox:
		$BoxButton.on_button_unpress()
		# weitere Logik
