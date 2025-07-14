@tool
extends EditorScript

func _run() -> void:
	export_current_mod()

func export_current_mod() -> void:
	var mod_name: String = "quantum_test_mod"
	var export_path: String = "res://exported_mods/%s/" % mod_name
	create_directories(export_path)
	export_resources(export_path)
	export_recipes(export_path)
	export_research(export_path)
	export_objectives(export_path)
	copy_assets(export_path)
	generate_mod_json(export_path, mod_name)
	print("Mod exported to: %s" % export_path)

func create_directories(base_path: String) -> void:
	var paths: Array[String] = [
		base_path + "data/resources/",
		base_path + "data/recipes/", 
		base_path + "data/research/",
		base_path + "data/objectives/",
		base_path + "assets/icons/",
		base_path + "assets/meshes/"
	]
	for path: String in paths:
		DirAccess.open("res://").make_dir_recursive(path)

func export_resources(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/resources/", export_path + "data/resources/")

func export_recipes(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/recipes/", export_path + "data/recipes/")

func export_research(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/research/", export_path + "data/research/")

func export_objectives(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/objectives/", export_path + "data/objectives/")

func copy_and_fix_tres_files(source_dir: String, target_dir: String) -> void:
	var dir: DirAccess = DirAccess.open(source_dir)
	if dir == null:
		return
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if file_name.ends_with(".tres"):
			fix_and_copy_tres(source_dir + file_name, target_dir + file_name)
		file_name = dir.get_next()

func fix_and_copy_tres(source_path: String, target_path: String) -> void:
	var file: FileAccess = FileAccess.open(source_path, FileAccess.READ)
	var content: String = file.get_as_text()
	file.close()
	content = content.replace('preload("res://assets/', 'preload("assets/')
	content = content.replace('ModKitResourceData', 'ResourceData')
	content = content.replace('ModKitResearchData', 'ResearchData')
	content = content.replace('ModKitObjectiveData', 'ObjectiveData') 
	content = content.replace('ModKitRecipe', 'Recipe')
	var output_file: FileAccess = FileAccess.open(target_path, FileAccess.WRITE)
	output_file.store_string(content)
	output_file.close()

func copy_assets(export_path: String) -> void:
	copy_directory_recursive("res://assets/", export_path + "assets/")

func copy_directory_recursive(source: String, target: String) -> void:
	var dir: DirAccess = DirAccess.open(source)
	if dir == null:
		return
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		var source_file: String = source + file_name
		var target_file: String = target + file_name
		if dir.current_is_dir():
			DirAccess.open("res://").make_dir_recursive(target_file)
			copy_directory_recursive(source_file + "/", target_file + "/")
		else:
			dir.copy(source_file, target_file)
		file_name = dir.get_next()

func generate_mod_json(export_path: String, mod_name: String) -> void:
	var mod_config: Dictionary = {
		"mod_id": mod_name,
		"name": "Quantum Test Mod",
		"version": "1.0.0", 
		"author": "ModderName",
		"description": "A test mod created with the modding kit",
		"resources": get_file_list(export_path + "data/resources/"),
		"recipes": get_file_list(export_path + "data/recipes/"),
		"research": get_file_list(export_path + "data/research/"),
		"objectives": get_file_list(export_path + "data/objectives/")
	}
	var json_file: FileAccess = FileAccess.open(export_path + "mod.json", FileAccess.WRITE)
	json_file.store_string(JSON.stringify(mod_config, "\t"))
	json_file.close()

func get_file_list(dir_path: String) -> Array[String]:
	var files: Array[String] = []
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		return files
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if file_name.ends_with(".tres"):
			files.append("data/" + dir_path.get_file() + "/" + file_name)
		file_name = dir.get_next()
	return files
