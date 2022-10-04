class_name PlayerPosition
extends Node

var file = "res://PlayerPosition.save"

func set_player_position(x: float, y: float):
	var save = File.new()
	save.open(file, File.WRITE)
	save.store_line(str(x))
	save.store_line(str(y))
	save.close()

func load_player_position():
	var save = File.new()
	if not save.file_exists(file):
		return {"x":null, "y":null}
	
	save.open(file, File.READ)
	var xValue = float(save.get_line())
	var yValue = float(save.get_line())
	save.close()
	
	return {"x":xValue, "y":yValue}

func reset():
	var save = File.new()
	if save.file_exists(file):
		var dir = Directory.new()
		dir.remove(file)
