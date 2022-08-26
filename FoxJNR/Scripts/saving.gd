class_name Saving
extends Node2D

# Speichert den Spielstand.
func save_game() -> void:
	# Neue Datei erzeugen.
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	
	# Alle Nodes, die in der Gruppe Persist sind.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Überprüfe node danach, ob dieser instanziiert ist.
		if node.filename.empty():
			# Node ist nicht instanziiert.
			continue
		
		# Überprüfe ob Node eine save Funktion hat.
		if !node.has_method("save"):
			# Hat keine save Funktion.
			continue
		
		# Node speichern.
		var node_data = node.call("save")
		
		# In Datei schreiben
		save_game.store_line(to_json(node_data))
	save_game.close()

# Lädt, falls vorhanden, das Spiel.
func load_game() -> void:
	var save_game = File.new()
	
	# Wenn kein Save existiert.
	if not save_game.file_exists("user://savegame.save"):
		pass
