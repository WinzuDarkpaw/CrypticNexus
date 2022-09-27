extends Node2D

#
#	CONSTANTS FOR LEVEL.
#

var saveFile = "user://save_TesteLevel.save"

var buttonPushedTexture = "res://Textures/TileMaps/GreenSpringField/z01_buttonPushed.png"
var buttonUnpushedTexture = "res://Textures/TileMaps/GreenSpringField/z01_button.png"

var boxButtonTexture = "res://Textures/TileMaps/GreenSpringField/z06_boxButton.png"
var boxButtonPushedTexture = "res://Textures/TileMaps/GreenSpringField/z06_boxButton_lit.png"

var shieldTexture = "res://Textures/TileMaps/GreenSpringField/z07_shieldInfo.png"
var speechBubble = "res://Textures/TileMaps/GreenSpringField/z08_speechBubbleQuestion.png"

var boxTexture = "res://Textures/TileMaps/GreenSpringField/z01_pushableBox1.png"
var litBoxTexture = "res://Textures/TileMaps/GreenSpringField/z01_pushableBox1_lit.png"

func _ready():
	# RESET SAVE FILE.
	# reset_save_file(saveFile)
	
	$Button.initialize(buttonPushedTexture, buttonUnpushedTexture)
	$Water.initialize()
	$PushableBox.initialize(boxTexture, $PushableBox.position.x, $PushableBox.position.y)
	$PushableBox2.initialize(boxTexture, $PushableBox2.position.x, $PushableBox2.position.y)
	$BoxButton.initialize(boxButtonTexture, boxButtonPushedTexture)
	$ShieldInfo.initialize(shieldTexture, speechBubble)
	$PortalLeft.play_flipped()
	$PortalRight.play()
	load_level(saveFile)

func _exit_tree():
	save_level(saveFile)

func _process(delta):
	if $ShieldInfo.isInteractable and Input.is_action_pressed("Interact"):
		$DialogueBox.visible = true
	else:
		$DialogueBox.visible = false



func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
	if body is RiddleBox:
		body.position.x = body.stdPosX
		body.position.y = body.stdPosY

func _on_Button_body_entered(body):
	if body is Player or $Button.isPressed == 1:
		# Kollision dynamisch einschalten.
		$TileMap2.collision_layer = 1
		$TileMap2.collision_mask = 1
		# Sichtbarkeit einschalten.
		$TileMap2.visible = true
		$Button.on_press()

func _on_BoxButton_body_entered(body):
	if body == $PushableBox:
		$BoxButton.press()
		$PushableBox.set_texture(litBoxTexture)
		# weitere Logik


func _on_BoxButton_body_exited(body):
	if body == $PushableBox:
		$BoxButton.unpress()
		$PushableBox.set_texture(boxTexture)
		# weitere Logik


func _on_ShieldInfo_body_entered(body):
	if body is Player:
		$ShieldInfo.toggle_speechbubble()


func _on_ShieldInfo_body_exited(body):
	if body is Player:
		$ShieldInfo.toggle_speechbubble()

func save_level(file):
	var save_file = File.new()
	save_file.open(file, File.WRITE)
	# Box Positions.
	save_file.store_line(str($PushableBox.position.x))
	save_file.store_line(str($PushableBox.position.y))
	save_file.store_line(str($PushableBox2.position.x))
	save_file.store_line(str($PushableBox2.position.y))
	# Pressed State.
	save_file.store_line(str($Button.isPressed))
	# Collected Objects (NYI)
	save_file.close()

func load_level(file):
	var save_file = File.new()
	if not save_file.file_exists(file):
		return
	save_file.open(file, File.READ)
	# Box Positions.
	$PushableBox.position.x = float(save_file.get_line())
	$PushableBox.position.y = float(save_file.get_line())
	$PushableBox2.position.x = float(save_file.get_line())
	$PushableBox2.position.y = float(save_file.get_line())
	# Pressed State.
	$Button.isPressed = int(save_file.get_line())
	$Button.reload()
	# Collected Objects (NYI)
	save_file.close()

func reset_save_file(file):
	var save_file = File.new()
	if save_file.file_exists(file):
		var dir = Directory.new()
		dir.remove(file)
	save_file.close()


func _on_PortalLeft_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://Levels/TestLevel/Level_t1_scn2.tscn")
