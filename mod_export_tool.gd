@tool
extends EditorScript

const MOD_ID: String = "quantum_test_mod"
const MOD_NAME: String = "Quantum Test Mod"
const MOD_VERSION: String = "1.0.0"
const AUTHOR_NAME: String = "ModderName"
const MOD_DESCRIPTION: String = "A test mod created with the modding kit"

func _run() -> void:
	export_current_mod()

func export_current_mod() -> void:
	var export_path: String = "res://exported_mods/%s/" % MOD_ID
	create_directories(export_path)
	export_resources(export_path)
	export_recipes(export_path)
	export_research(export_path)
	export_objectives(export_path)
	copy_assets(export_path)
	generate_mod_json(export_path)
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
	copy_and_fix_tres_files("res://working/resources/", export_path + "data/resources/", true)

func export_recipes(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/recipes/", export_path + "data/recipes/", false)

func export_research(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/research/", export_path + "data/research/", false)

func export_objectives(export_path: String) -> void:
	copy_and_fix_tres_files("res://working/objectives/", export_path + "data/objectives/", false)

func copy_and_fix_tres_files(source_dir: String, target_dir: String, is_resource: bool) -> void:
	var dir: DirAccess = DirAccess.open(source_dir)
	if dir == null:
		return
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if file_name.ends_with(".tres"):
			fix_and_copy_tres(source_dir + file_name, target_dir + file_name, is_resource)
		file_name = dir.get_next()

func fix_and_copy_tres(source_path: String, target_path: String, is_resource: bool) -> void:
	var file: FileAccess = FileAccess.open(source_path, FileAccess.READ)
	var content: String = file.get_as_text()
	file.close()
	var lines: PackedStringArray = content.split("\n")
	var filtered_lines: PackedStringArray = []
	var script_ext_resource_id: String = ""
	var asset_ext_resource_ids: Array[String] = []
	for line: String in lines:
		if line.contains("[ext_resource") and line.contains("Script") and (line.contains("ModKit") or line.contains("mod_kit")):
			script_ext_resource_id = _extract_id_from_ext_resource(line)
		elif line.contains("[ext_resource") and line.contains("res://assets/"):
			var asset_id: String = _extract_id_from_ext_resource(line)
			asset_ext_resource_ids.append(asset_id)
	for line: String in lines:
		if line.contains("[ext_resource") and line.contains("Script") and (line.contains("ModKit") or line.contains("mod_kit")):
			continue
		elif line.contains("[ext_resource") and line.contains("res://assets/"):
			continue
		elif line.contains("script = ExtResource") and script_ext_resource_id != "":
			continue
		elif line.contains("metadata/_custom_type_script"):
			continue
		elif line.contains("ExtResource(") and script_ext_resource_id != "" and line.contains(script_ext_resource_id):
			continue
		elif line.contains("icon = ExtResource(") or line.contains("mesh = ExtResource("):
			var property_name: String = line.split(" = ")[0]
			filtered_lines.append(property_name + " = null")
			continue
		elif line.contains("ExtResource("):
			var is_asset_reference: bool = false
			for asset_id: String in asset_ext_resource_ids:
				if line.contains(asset_id):
					is_asset_reference = true
					break
			if is_asset_reference:
				var property_name: String = line.split(" = ")[0]
				filtered_lines.append(property_name + " = null")
				continue
		var modified_line: String = line
		modified_line = modified_line.replace('script_class="ModKitResourceData"', '')
		modified_line = modified_line.replace('script_class="ModKitResearchData"', '')
		modified_line = modified_line.replace('script_class="ModKitObjectiveData"', '')
		modified_line = modified_line.replace('script_class="ModKitRecipe"', '')
		modified_line = modified_line.replace('script_class="ResourceData"', '')
		modified_line = modified_line.replace('script_class="ResearchData"', '')
		modified_line = modified_line.replace('script_class="ObjectiveData"', '')
		modified_line = modified_line.replace('script_class="Recipe"', '')
		filtered_lines.append(modified_line)
	if is_resource:
		if not has_icon_property(filtered_lines):
			filtered_lines.append("icon = null")
		if not has_mesh_property(filtered_lines):
			filtered_lines.append("mesh = null")
	var final_content: String = "\n".join(filtered_lines)
	final_content = _fix_load_steps(final_content, 1)
	var output_file: FileAccess = FileAccess.open(target_path, FileAccess.WRITE)
	output_file.store_string(final_content)
	output_file.close()

func has_icon_property(lines: PackedStringArray) -> bool:
	for line: String in lines:
		if line.contains("icon ="):
			return true
	return false

func has_mesh_property(lines: PackedStringArray) -> bool:
	for line: String in lines:
		if line.contains("mesh ="):
			return true
	return false

func _extract_id_from_ext_resource(line: String) -> String:
	var id_start: int = line.rfind('id="') + 4
	if id_start == 3:
		return ""
	var id_end: int = line.find('"', id_start)
	if id_end == -1:
		return ""
	return line.substr(id_start, id_end - id_start)

func _fix_load_steps(content: String, new_load_steps: int) -> String:
	var regex: RegEx = RegEx.new()
	regex.compile('load_steps=\\d+')
	return regex.sub(content, "load_steps=" + str(new_load_steps))

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

func generate_mod_json(export_path: String) -> void:
	var mod_config: Dictionary = {
		"mod_id": MOD_ID,
		"name": MOD_NAME,
		"version": MOD_VERSION, 
		"author": AUTHOR_NAME,
		"description": MOD_DESCRIPTION,
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
	var subfolder_name: String = dir_path.get_file()
	if subfolder_name == "":
		subfolder_name = dir_path.trim_suffix("/").get_file()
	while file_name != "":
		if file_name.ends_with(".tres"):
			files.append("data/%s/%s" % [subfolder_name, file_name])
		file_name = dir.get_next()
	return files
