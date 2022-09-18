extends Node2D

func _ready():
	$Button.set_textures("res://Textures/TileMaps/GreenSpringField/z01_buttonPushed.png", "res://Textures/TileMaps/GreenSpringField/z01_button.png")
	$Button.on_load()
	$PortalLeft.play_flipped_anim()
	$PortalRight.play_anim()
	$Water.play_anim()
	$PushableBox.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png")
	$PushableBox.set_default_position(360.833, -23.031)
	$PushableBox2.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png")
	$PushableBox2.set_default_position(230.628, -65.123)
	$BoxButton.set_textures("res://Textures/TileMaps/GreenSpringField/z06_boxButton.png", "res://Textures/TileMaps/GreenSpringField/z06_boxButton_lit.png")
	$BoxButton.on_button_unpress()
	$ShieldInfo.set_textures("res://Textures/TileMaps/GreenSpringField/z07_shieldInfo.png", "res://Textures/TileMaps/GreenSpringField/z08_speechBubbleQuestion.png")

func _process(delta):
	# Dialogfelder anzeigen, wenn "F" gedrückt wird.
	if $ShieldInfo.isInteractable and Input.is_action_pressed("Interact"):
		$DialogueBox.visible = true
	else:
		$DialogueBox.visible = false

func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
	if body is RiddleBox:
		body.position.x = body.posX
		body.position.y = body.posY

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
		$PushableBox.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1_lit.png")


func _on_BoxButton_body_exited(body):
	if body == $PushableBox:
		$BoxButton.on_button_unpress()
		$PushableBox.set_texture("res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png")
		# weitere Logik


func _on_ShieldInfo_body_entered(body):
	$ShieldInfo.toggle_speechbubble()


func _on_ShieldInfo_body_exited(body):
	$ShieldInfo.toggle_speechbubble()
