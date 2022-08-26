class_name Saving
extends Node2D

# Speichert den Spielstand.
func save_game(id: int) -> void:
	"""
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
	"""
	pass

# Lädt, falls vorhanden, das Spiel.
func load_game(id: int) -> void:
	"""
	var save_game = File.new()
	
	# Wenn kein Save existiert.
	if not save_game.file_exists("user://savegame.save"):
		return
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()
	
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		
		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])
		
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
	save_game.close()
	"""
	pass
