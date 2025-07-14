extends Resource
class_name ModKitObjectiveData

@export var id: String = ""
@export var description: String = ""
@export var reward: int = 0
@export var xp_reward: int = 0
@export var skill_point_reward: int = 0
@export var check_type: int = 0
@export var target_value: int = 1
@export var target_building_type: int = 0
@export var target_resource_type: int = 0
@export var chest_type: int = 0
@export var dependencies: Array[String] = []
@export var custom_check_method: String = ""
