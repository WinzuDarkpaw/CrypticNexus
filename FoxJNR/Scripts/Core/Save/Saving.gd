class_name Saving
extends Node

const SaveGame = preload("res://Scripts/Core/Save/SaveGame.gd")
var SAVE_FOLDER : String = "res://debug/save"
var SAVE_NAME_TEMPLATE : String = "save_%03d.tres"

# Speichert den Spielstand.
func save_game(id: int) -> void:
	var save_game = SaveGame.new()
	for node in get_tree().get_nodes_in_group("save"):
		node.save(save_game)
	
	var directory : Directory = Directory.new()
	if not directory.dir_exists(SAVE_FOLDER):
		directory.make_dir_recursive(SAVE_FOLDER)
	
	var save_path = SAVE_FOLDER.plus_file(SAVE_NAME_TEMPLATE % id)
	var error : int = ResourceSaver.save(save_path, save_game)
	if error != OK:
		print("Error saving file!")

# Lädt, falls vorhanden, das Spiel.
func load_game(id: int) -> void:
	var save_file_path : String = SAVE_FOLDER.plus_file(SAVE_NAME_TEMPLATE % id)
	var file : File = File.new()
	if not file.file_exists(save_file_path):
		return
	
	var save_game : Resource = load(save_file_path)
	for node in get_tree().get_nodes_in_group("save"):
		node.load(save_game)
