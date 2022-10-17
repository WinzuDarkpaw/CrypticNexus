class_name Scene_TitleScreen

extends Node2D

# ==============================================================================
# == Das betreten der DeathZone im Title Screen beendet das Spiel.            ==
# ==============================================================================
func DeathZone_entered(body):
	# Spiel mit Exitcode 0 (vorsätzlich) schließen.
	get_tree().quit(0)
