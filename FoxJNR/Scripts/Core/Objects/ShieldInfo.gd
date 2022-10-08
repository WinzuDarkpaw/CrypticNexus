extends Area2D

var isInteractable = false

var shieldTexture
var speechbubbleTexture

func toggle_speechbubble() -> void:
	if $Sprite2.visible:
		$Sprite2.visible = false
		isInteractable = false
	else:
		$Sprite2.visible = true
		isInteractable = true

func initialize(shield, speechbubble) -> void:
	shieldTexture = load(shield)
	speechbubbleTexture = load(speechbubble)
	$Sprite.texture = shieldTexture
	$Sprite2.texture = speechbubbleTexture
	
	$Sprite2.visible = false
