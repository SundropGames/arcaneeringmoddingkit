extends Resource  
class_name ModKitResearchData

@export var id: String = ""
@export var name: String = ""
@export var description: String = ""
@export var cost: int = 0
@export var dependencies: Array[String] = []
@export var objective_dependencies: Array[String] = []
@export var vegetation_requirements: Dictionary = {}
@export var effect_type: int = 0
@export var affected_building_types: Array[int] = []
@export var affected_resource_type: int = 0
@export var is_hidden: bool = false
@export var custom_effect_method: String = ""
@export var research_category: int = 0
