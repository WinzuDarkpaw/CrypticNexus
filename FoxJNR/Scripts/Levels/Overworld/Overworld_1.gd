class_name OverworldScene1

extends Node2D

# Wichtiges für die Overworld
# -- Leveldaten (Abgeschlossen, nicht abgeschlossen) werden in
# user://save/levels.save
# Weitere Infos in Speicherkonvention.txt

const _startGamePortalTexture = "res://Graphics/Tiles/Interactables/Titlescreen Portals/Titlescreen_Portal.png"

# ==============================================================================
# == Setzt beim Laden der Szene die Texturen der Objekte.                     ==
# ==============================================================================
func _ready():
	$PortalBack.set_texture(_startGamePortalTexture)
	$PortalNextSubarea.set_texture(_startGamePortalTexture)

# ==============================================================================
# == Überprüft konstant, ob mit gewissen Objekten interargiert                ==
# == werden kann und behandelt dessen Logik.                                  ==
# ==============================================================================
func _physics_process(delta):
	if $PortalBack.IsInteractable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene("res://Levels/TitleScreen/TitleScreen.tscn")
	if $PortalNextSubarea.IsInteractable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene("res://Levels/Overworld/Overworld_1_2.tscn")


# ==============================================================================
# == Setzt die Interagierbarkeit des Portals, wenn das Portal berührt wird.   ==
# ==============================================================================
func on_portal_body_entered(body):
	if body is Player:
		$PortalBack.toggle_interactability()

# ==============================================================================
# == Setzt die Interagierbarkeit des Portals,                                 ==
# == wenn das Portal verlassen wird.                                          ==
# ==============================================================================
func on_portal_body_exited(body):
	if body is Player:
		$PortalBack.toggle_interactability()

# ==============================================================================
# == Setzt die Interagierbarkeit des Portals, wenn das Portal berührt wird.   ==
# ==============================================================================
func _on_portalNextSubarea_body_entered(body):
	if body is Player:
		$PortalNextSubarea.toggle_interactability()
		
# ==============================================================================
# == Setzt die Interagierbarkeit des Portals,                                 ==
# == wenn das Portal verlassen wird.                                          ==
# ==============================================================================
func _on_portalNextSubarea_body_exited(body):
	if body is Player:
		$PortalNextSubarea.toggle_interactability()
