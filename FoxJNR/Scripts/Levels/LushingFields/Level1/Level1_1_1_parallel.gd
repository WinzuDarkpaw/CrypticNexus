extends Node2D

const _portalTexture = "res://Graphics/Tiles/Interactables/Titlescreen Portals/Titlescreen_Portal.png"

# ==============================================================================
# == Setzt beim Laden der Szene die Texturen der Objekte.                     ==
# ==============================================================================
func _ready():
	$Portal.set_texture(_portalTexture)

# ==============================================================================
# == Überprüft konstant, ob mit gewissen Objekten interargiert                ==
# == werden kann und behandelt dessen Logik.                                  ==
# ==============================================================================
func _physics_process(delta):
	if $Portal.IsInteractable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene("res://Levels/LushingFields_World1/Level1/Level1_1_1.tscn")

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
