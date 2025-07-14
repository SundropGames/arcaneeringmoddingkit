@tool
extends EditorScript

func _run() -> void:
	cleanup_modding_kit()

func cleanup_modding_kit() -> void:
	print("Cleaning modding kit...")
	clean_directory("res://working/resources/")
	clean_directory("res://working/recipes/")
	clean_directory("res://working/research/")
	clean_directory("res://working/objectives/")
	clean_directory("res://assets/icons/")
	clean_directory("res://assets/meshes/")
	clean_directory("res://exported_mods/")
	print("Modding kit cleaned! Ready for new mod creation.")

func clean_directory(dir_path: String) -> void:
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		return
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir() and file_name != ".gitkeep":
			dir.remove(file_name)
			print("Deleted: %s%s" % [dir_path, file_name])
		elif dir.current_is_dir() and file_name != "." and file_name != "..":
			remove_directory_recursive(dir_path + file_name + "/")
		file_name = dir.get_next()

func remove_directory_recursive(dir_path: String) -> void:
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		return
	dir.list_dir_begin()
	var file_name: String = dir.get_next()
	while file_name != "":
		if dir.current_is_dir() and file_name != "." and file_name != "..":
			remove_directory_recursive(dir_path + file_name + "/")
		elif not dir.current_is_dir():
			dir.remove(file_name)
		file_name = dir.get_next()
	dir.list_dir_end()
	DirAccess.open("res://").remove(dir_path)
