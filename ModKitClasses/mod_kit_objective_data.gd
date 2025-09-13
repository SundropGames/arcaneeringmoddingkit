extends Resource
class_name ModKitObjectiveData

@export var id: String = ""  # unique string
@export var description: String = ""  # in-game description
@export var reward: int = 0  # Credit reward
@export var xp_reward: int = 0  # XP reward
@export var skill_point_reward: int = 0  # Skill point reward
@export var check_type: int = 0  # Enum for what should be checked; 0: BUILDING_COUNT, 1: RESOURCE_PRODUCED; 2: RESEARCH_COMPLETED, 3: PRODUCTION_CHAIN, 4: MARKET_SALES, 5: CHEST_OPENED, 6: WATCHTOWER_DESTROYED, 7: SPELLS_CAST, 8: KNOWN_SPELLS, 9: BUILDINGS_IN_CLEARED_AREAS, 10: CUSTOM, 11: RECIPE_UNLOCKED
@export var target_value: int = 1  # Threshold to fulfil objective; only matters for some check_type values (0, 1, 4, 7, 9)
@export var target_building_type: int = 0  # Whether threshold applies to any specific building (Enum) only relevant for check_type = 0
@export var target_resource_type: int = 0  # Whether threshold applies to any specific resource (Enum); only relevant for check_type = 1
@export var chest_type: int = 0  # Whether threshold applies to any specific chest type (Enum); only relevant for check_type = 5
@export var dependencies: Array[String] = []  # Pre-requisite objectives that need to be fulfilled to show & complete this objective
@export var research_dependencies: Array[String] = []  # Pre-requisite research that need to be completed to show & complete this objective

# Enum IDs for all buildings from Act I:

#NONE = 0,
#DELETE = 1,
#MINER = 2,
#CONVEYOR_BELT = 3,
#SMELTER = 4,
#WAREHOUSE = 5,
#MANA_CRYSTAL = 6,
#ASSEMBLER = 7,
#MARKET = 8,
#POWER_GENERATOR = 9,
#SPLITTER = 10,
#MERGER = 11,
#ELEVATOR = 12,
#MANA_FORGE = 13,
#ELEVATOR_SPLITTER = 14,
#ELEVATOR_MERGER = 15,
#HYDRO_GENERATOR = 16,
#SUPER_SPLITTER = 17,
#ARCANE_REACTOR = 18,
#POWER_SPIRE = 19,
#POTION_CAULDRON = 20,
#CONVEYOR_BELT_RIGHT = 21,
#CONVEYOR_BELT_LEFT = 22,
#SOLAR_RESONATOR = 23,
#CONVEYOR_BELT_BRIDGE = 24,
#CONVEYOR_BELT_BRIDGE_LEFT = 25,
#CONVEYOR_BELT_BRIDGE_RIGHT = 26,
#WARD_GENERATOR = 27,
#SOLAR_GENERATOR = 29,
#ELEVATOR_BRIDGE = 30,
#BANK = 32,

# Enum IDs for all resources from Act I:

#NONE = 0,
#ORE = 1,  # phase 1
#INGOT = 2,  # phase 1
#MAGIC_ESSENCE = 3,  # phase 1
#COMPONENT = 4,  # phase 1
#SUNDROP = 5,  # phase 1
#GOLD_ORE = 6,  # phase 1
#IRON_KEY = 7,  # phase 1
#GOLD_INGOT = 8,  # phase 1
#GOLD_KEY = 9,  # phase 1
#ARCANE_CRYSTAL = 10,  # phase 1
#ADVANCED_MACHINERY = 11,  # phase 1
#ARCANE_DEVICE = 12,  # phase 1
#MASTER_COMPONENT = 13,  # phase 1
#MANA_BOMB = 14,  # phase 1
#ARCANE_CANNON = 15,  # phase 1
#SIEGE_CRYSTAL = 16,  # phase 1
#COAL = 17,  # phase 1
#CINDER = 18,  # phase 1
#GOLD_COMPONENT = 48,  # phase 1
