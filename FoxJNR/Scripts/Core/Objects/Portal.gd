extends Area2D

var IsInteractable = false

var _texture

func set_texture(path):
	_texture = load(path)
	$Sprite.texture = _texture

func toggle_interactability():
	if IsInteractable:
		IsInteractable = false
	else:
		IsInteractable = true
