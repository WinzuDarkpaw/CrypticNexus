extends Node2D

func _ready():
	$Button.initialize("res://Textures/TileMaps/GreenSpringField/z01_buttonPushed.png", "res://Textures/TileMaps/GreenSpringField/z01_button.png")
	$Water.initialize()
	$PushableBox.initialize("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png", $PushableBox.position.x, $PushableBox.position.y)
	$PushableBox2.initialize("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png", $PushableBox2.position.x, $PushableBox2.position.y)
	$BoxButton.initialize("res://Textures/TileMaps/GreenSpringField/z06_boxButton.png", "res://Textures/TileMaps/GreenSpringField/z06_boxButton_lit.png")
	$ShieldInfo.initialize("res://Textures/TileMaps/GreenSpringField/z07_shieldInfo.png", "res://Textures/TileMaps/GreenSpringField/z08_speechBubbleQuestion.png")
	$PortalLeft.play_flipped()
	$PortalRight.play()
	# LOAD FILES OF OBJECTS.

func _process(delta):
	if $ShieldInfo.isInteractable and Input.is_action_pressed("Interact"):
		$DialogueBox.visible = true
	else:
		$DialogueBox.visible = false

func _exit_tree():
	# SAVE FILES OF OBJECTS.
	pass

func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
	if body is RiddleBox:
		body.position.x = body.stdPosX
		body.position.y = body.stdPosY

func _on_Button_body_entered(body):
	if body is Player:
		# Kollision dynamisch einschalten.
		$TileMap2.collision_layer = 1
		$TileMap2.collision_mask = 1
		# Sichtbarkeit einschalten.
		$TileMap2.visible = true
		$Button.on_press()

func _on_BoxButton_body_entered(body):
	if body == $PushableBox:
		# weitere Logik
		$BoxButton.press()
		$PushableBox.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1_lit.png")


func _on_BoxButton_body_exited(body):
	if body == $PushableBox:
		$BoxButton.unpress()
		$PushableBox.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png")
		# weitere Logik


func _on_ShieldInfo_body_entered(body):
	$ShieldInfo.toggle_speechbubble()


func _on_ShieldInfo_body_exited(body):
	$ShieldInfo.toggle_speechbubble()
