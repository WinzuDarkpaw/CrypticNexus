extends Node2D

func _ready():
	$Area2D.play()
	
	var playerPos = PlayerPosition.new()
	var playerPositionValues = playerPos.load_player_position()
	var pX = playerPositionValues.x
	var pY = playerPositionValues.y

	if pX != null and pY != null:
		$Player.position.x = pX
		$Player.position.y = pY

func _process(delta):
	var format_string = "x: {x}, y: {y}"
	var actual = format_string.format({"x": $Player.position.x, "y": $Player.position.y})
	
	print(actual)

func _on_Area2D_body_entered(body):
	var playerPos = PlayerPosition.new()
	playerPos.set_player_position(375.6, -12.1)
	
	if body is Player:
		get_tree().change_scene("res://Levels/TestLevel/Level_t1.tscn")
