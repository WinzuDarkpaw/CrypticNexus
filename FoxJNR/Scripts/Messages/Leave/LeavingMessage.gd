extends Node2D


# ==============================================================================
# == Das betreten der Zone beendet das Spiel.                                 ==
# ==============================================================================
func on_LeaveGame_body_entered(body):
	if body is Player:
		get_tree().quit(0)

# ==============================================================================
# == Das betreten der Zone bringt dich in das TitleScreen zurück.             ==
# ==============================================================================
func on_Resume_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://Levels/TitleScreen/TitleScreen.tscn")
