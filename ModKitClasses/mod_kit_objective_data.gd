extends Resource
class_name ModKitObjectiveData

@export var id: String = ""  # unique string
@export var description: String = ""  # in-game description
@export var reward: int = 0  # Credit reward
@export var xp_reward: int = 0  # XP reward
@export var skill_point_reward: int = 0  # Skill point reward
@export var check_type: int = 0  # Enum for what should be checked; 0: BUILDING_COUNT, 1: RESOURCE_PRODUCED; 2: RESEARCH_COMPLETED, 3: PRODUCTION_CHAIN, 4: MARKET_SALES, 5: CHEST_OPENED, 6: WATCHTOWER_DESTROYED, 7: SPELLS_CAST, 8: KNOWN_SPELLS, 9: BUILDINGS_IN_CLEARED_AREAS, 10: CUSTOM, 11: RECIPE_UNLOCKED
@export var target_value: int = 1  # Threshold to fulfil objective; only matters for some check_type values
@export var target_building_type: int = 0  # Whether threshold applies to any specific building (Enum) only relevant for check_type = 0
@export var target_resource_type: int = 0  # Whether threshold applies to any specific resource (Enum); only relevant for check_type = 1
@export var chest_type: int = 0  # Whether threshold applies to any specific chest type (Enum); only relevant for check_type = 5
@export var dependencies: Array[String] = []  # Pre-requisite objectives that need to be fulfilled to show & complete this objective
@export var research_dependencies: Array[String] = []  # Pre-requisite research that need to be completed to show & complete this objective
