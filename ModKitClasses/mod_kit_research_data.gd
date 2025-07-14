extends Resource  
class_name ModKitResearchData

@export var id: String = ""  # unique string
@export var name: String = ""  # in-game name
@export var description: String = ""  # in-game description
@export var cost: int = 0  # Credit costs
@export var dependencies: Array[String] = []  # Pre-requisite research that needs to be completed to show and complete this research
@export var objective_dependencies: Array[String] = []  # Pre-requisite objectives that needs to be completed to show and complete this research
@export var vegetation_requirements: Dictionary = {}  # Whether special vegetation resources need to be consumed for this research; of type {5:1}, where 1 unit of special vegetation with the Enum value 5 would be needed
@export var effect_type: int = 0  # Effect Enum; what kind of effect (0: RECIPE; 1: BUILDING_UNLOCK; 2: CONVEYOR_SPEED; 3: TRADE_PRICES; 4: MAGIC_TRADING; 5: RESOURCE_REFINEMENT; 6: POWER_EFFICIENCY; 7: SOLAR_POWER; 8: ADVANCED_POWER; 9: CUSTOM; 10: RESOURCE_UNLOCK
@export var affected_building_types: Array[int] = []  # Which building(s) will be unlocked by this research (as Enum values)
@export var affected_resource_type: int = 0  # Which resource will be unlocked by this research (as Enum value)
@export var is_hidden: bool = false  # Whether this research is not available via the research tree (e.g., only in chests or via merchants)
@export var research_category: int = 0  # Which category this research falls into (0: Foundation, 1: Production, 2: Magic)
