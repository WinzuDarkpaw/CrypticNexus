extends Area2D

var isInteractable = false

func toggle_speechbubble() -> void:
	if $Sprite2.visible:
		$Sprite2.visible = false
		isInteractable = false
	else:
		$Sprite2.visible = true
		isInteractable = true
