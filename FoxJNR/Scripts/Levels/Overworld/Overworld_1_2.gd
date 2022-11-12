class_name OverworldScene1_2

extends Node2D

const _startGamePortalTexture = "res://Graphics/Tiles/Interactables/Titlescreen Portals/Titlescreen_Portal.png"

# ==============================================================================
# == Setzt beim Laden der Szene die Texturen der Objekte.                     ==
# ==============================================================================
func _ready():
	$PortalBack.set_texture(_startGamePortalTexture)

# ==============================================================================
# == Überprüft konstant, ob mit gewissen Objekten interargiert                ==
# == werden kann und behandelt dessen Logik.                                  ==
# ==============================================================================
func _physics_process(delta):
	if $PortalBack.IsInteractable and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene("res://Levels/Overworld/Overworld_1.tscn")


func _on_portalBack_body_entered(body):
	if body is Player:
		$PortalBack.toggle_interactability()


func _on_portalBack_body_exited(body):
	if body is Player:
		$PortalBack.toggle_interactability()
