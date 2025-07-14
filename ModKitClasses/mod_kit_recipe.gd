extends Resource
class_name ModKitRecipe

@export var id: String = ""
@export var display_name: String = ""
@export var inputs: Dictionary = {}
@export var outputs: Dictionary = {}
@export var production_time: float = 5.0
@export var energy_consumption: int = 5
@export var required_building_level: int = 1
@export var required_research: String = ""
@export var byproducts: Dictionary = {}
@export var mana_consumption: float = 0.0
