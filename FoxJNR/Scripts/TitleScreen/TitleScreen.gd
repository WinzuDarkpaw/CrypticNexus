class_name Scene_TitleScreen

extends Node2D

const _startGamePortalTexture = "res://Graphics/Tiles/Interactables/Titlescreen Portals/Titlescreen_Portal.png"

# ==============================================================================
# == Setzt beim Laden der Szene die Texturen der Objekte.                     ==
# ==============================================================================
func _ready():
	$Portal.set_texture(_startGamePortalTexture)

# ==============================================================================
# == Überprüft konstant, ob mit gewissen Objekten interargiert                ==
# == werden kann und behandelt dessen Logik.                                  ==
# ==============================================================================
func _physics_process(delta):
	if $Portal.IsInteractable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene("res://Levels/Overworld/Overworld_1.tscn")

# ==============================================================================
# == Das betreten der DeathZone im Title Screen beendet das Spiel.            ==
# ==============================================================================
func DeathZone_entered(body):
	if body is Player:
		get_tree().change_scene("res://Levels/Leave/LeavingMessage.tscn")

# ==============================================================================
# == Setzt die Interagierbarkeit des Portals, wenn das Portal berührt wird.   ==
# ==============================================================================
func on_portal_body_entered(body):
	if body is Player:
		$Portal.toggle_interactability()

# ==============================================================================
# == Setzt die Interagierbarkeit des Portals,                                 ==
# == wenn das Portal verlassen wird.                                          ==
# ==============================================================================
func on_portal_body_exited(body):
	if body is Player:
		$Portal.toggle_interactability()
