extends Node2D

const objectSaveFile = "user://saves/level1_1/1_objects.save"

const _portalTexture = "res://Graphics/Tiles/Interactables/Titlescreen Portals/Titlescreen_Portal.png"
const boxButtonTexture = "res://Graphics/Tiles/Interactables/Buttons/BoxButton_off.png"
const boxButtonPushedTexture = "res://Graphics/Tiles/Interactables/Buttons/BoxButton_on.png"
const boxTexture = "res://Graphics/Tiles/Interactables/Boxes/Box.png"
const litBoxTexture = "res://Graphics/Tiles/Interactables/Boxes/Box.png"


# ==============================================================================
# == Setzt beim Laden der Szene die Texturen der Objekte.                     ==
# ==============================================================================
func _ready():
	setup_directory()
	
	$Portal.set_texture(_portalTexture)
	$BoxButton.initialize(boxButtonTexture, boxButtonPushedTexture)
	$PushableBox.initialize(boxTexture, $PushableBox.position.x, $PushableBox.position.y)
	
	$Border.collision_layer = 1
	$Border.collision_mask = 1
	$Border.visible = true
	
	load_scene()

# ==============================================================================
# == Überprüft konstant, ob mit gewissen Objekten interargiert                ==
# == werden kann und behandelt dessen Logik.                                  ==
# ==============================================================================
func _physics_process(delta):
	if $Portal.IsInteractable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene("res://Levels/LushingFields_World1/Level1/Level1_1_1_parallel.tscn")

# ==============================================================================
# == Wird aufgerufen, wenn die Szene verlassen wird.                          ==
# ==============================================================================
func _exit_tree():
	save_scene()

# ==============================================================================
# == Setzt die Szene beim Tod zurück.                                         ==
# ==============================================================================
func _on_DeathZone_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()

# ==============================================================================
# == Setzt die Interagierbarkeit des Portals, wenn das Portal berührt wird.   ==
# ==============================================================================
func _on_Portal_body_entered(body):
	if body is Player:
		$Portal.toggle_interactability()

# ==============================================================================
# == Setzt die Interagierbarkeit des Portals,                                 ==
# == wenn das Portal verlassen wird.                                          ==
# ==============================================================================
func _on_Portal_body_exited(body):
	if body is Player:
		$Portal.toggle_interactability()

# ==============================================================================
# == Speichert bestimmte Daten der Szene in einer Datei.                      ==
# ==============================================================================
func save_scene():
	var save_file = File.new()
	save_file.open(objectSaveFile, File.WRITE)
	# Box Positions.
	save_file.store_line(str($PushableBox.position.x))
	save_file.store_line(str($PushableBox.position.y))
	save_file.close()

# ==============================================================================
# == Lädt die Daten aus der gespeicherten Datei.                              ==
# ==============================================================================
func load_scene():
	var save_file = File.new()
	if not save_file.file_exists(objectSaveFile):
		return
	save_file.open(objectSaveFile, File.READ)
	# Box Positions.
	$PushableBox.position.x = float(save_file.get_line())
	$PushableBox.position.y = float(save_file.get_line())
	save_file.close()

# ==============================================================================
# == Erzeugt ein neues Verzeichnis für die Speicherdatei, wenn es noch        ==
# == nicht vorher existiert.                                                  ==
# ==============================================================================
func setup_directory():
	var dir = Directory.new()
	dir.open("user://")
	if not dir.dir_exists("user://saves"):
		dir.make_dir("saves")
	dir.open("user://saves")
	if not dir.dir_exists("user://saves/level1_1"):
		dir.make_dir("level1_1")


func _on_BoxButton_body_entered(body):
	if body == $PushableBox:
		$BoxButton.press()
		$Border.collision_layer = 0
		$Border.collision_mask = 0
		$Border.visible = false


func _on_BoxButton_body_exited(body):
	if body == $PushableBox:
		$BoxButton.unpress()
		$Border.collision_layer = 1
		$Border.collision_mask = 1
		$Border.visible = true
