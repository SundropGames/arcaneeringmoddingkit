extends Resource
class_name ModKitObjectiveData

@export var id: String = ""  # unique string
@export var description: String = ""  # in-game description
@export var reward: int = 0  # Credit reward
@export var xp_reward: int = 0  # XP reward
@export var skill_point_reward: int = 0  # Skill point reward
@export var check_type: int = 0  # Enum for what should be checked; see below for options
@export var target_value: int = 1  # Threshold to fulfil objective; only matters for some check_type values
@export var target_building_type: int = 0  # Whether threshold applies to any specific building (Enum); only relevant for check_type = 0
@export var target_resource_type: int = 0  # Whether threshold applies to any specific resource (Enum); only relevant for check_type = 1 and 18
@export var target_critter_id: int = 0  # Which critter (Enum: 0 BIRD, 1 BUTTERFLY, 2 FISH, 3 SNAIL, 4 DRAGON, 5 WHALE, 6 CROW); only relevant for check_type = 28 and 29
@export var chest_type: int = 0  # Whether threshold applies to any specific chest type (Enum: 0 NONE, 1 BASIC, 2 IRON, 3 GOLD, 4 CRYSTAL, 5 BRONZE, 6 HARMONIC, 7 VOID); only relevant for check_type = 5
@export var dependencies: Array[String] = []  # Pre-requisite objectives that need to be fulfilled to show & complete this objective
@export var research_dependencies: Array[String] = []  # Pre-requisite research that need to be completed to show & complete this objective
@export var spell_reward: int = 0  # Spell reward (Enum; 0 = none)
@export var vegetation_reward: int = 0  # Special vegetation reward (Enum: 0 FOREST_MUSHROOM, 1 PLAINS_HERB, 2 WETLAND_MOSS, 3 DESERT_CACTUS, 4 MANA_TREE (don't use), 5 ANCIENT_WISDOM, 6 GOLDEN_MUSHROOM, 7 GOLDEN_HERB, 8 GOLDEN_MOSS, 9 GOLDEN_CACTUS)
@export var vegetation_reward_amount: int = 0  # How much vegetation_reward
@export var required_challenge_mode: int = 0  # 0 = objective is active in any mode; 1 = Water World only

# Enum IDs for check_type:

#0: BUILDING_COUNT,
#1: RESOURCE_PRODUCED,
#2: RESEARCH_COMPLETED,
#3: PRODUCTION_CHAIN,
#4: MARKET_SALES,
#5: CHEST_OPENED,
#6: WATCHTOWER_DESTROYED,
#7: SPELLS_CAST,
#8: KNOWN_SPELLS,
#9: BUILDINGS_IN_CLEARED_AREAS,
#10: CUSTOM,  # not available to mods
#11: RECIPE_UNLOCKED,
#12: TOTAL_BUILDINGS, # Check total number of buildings across all types
#13: CREDIT_AMOUNT, # Check current credit amount
#14: TRADES_MADE, # Check total number of successful trades with merchants
#15: BLUEPRINT_CREATED,
#16: BLUEPRINT_PLACED,
#17: CRITTERS_CAUGHT,
#18: RESOURCE_THROUGHPUT, # Check items per minute for a specific resource
#19: MANA_GENERATED,
#20: PRODUCED_BYPRODUCTS,
#21: HEAT_QUENCHED,
#22: OBELISKS_ACTIVATED,
#23: POTIONS_BREWED,
#24: TYPES_OF_POTION,
#25: OWNED_RELICS,
#26: MANA_CONSUMED,
#27: RARE_CRITTERS_CAUGHT,
#28: CRITTERS_CAUGHT_BY_TYPE,
#29: RARE_CRITTERS_CAUGHT_BY_TYPE

# Enum IDs for all buildings:

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
#CARAVAN_STATION = 28,
#SOLAR_GENERATOR = 29,
#ELEVATOR_BRIDGE = 30,
#FLUID_EXTRACTOR = 31,
#BANK = 32,
#CRUSHER = 33,
#MANA_BATTERY = 34,
#PORT = 35,
#WALL = 36,
#WALL_CORNER = 37,
#WALL_TOWER = 38,
#THROUGHPUT_COUNTER = 39,
#ARCH = 40,
#CLIMATE_CONTROLLER = 41,
#MEGA_MERGER = 42,
#MANA_CONVERTER = 43,
#SIGNPOST = 44,
#MANA_SPIRE = 45,
#BIG_SMELTER = 46,
#GENERATOR_MK2 = 47,
#COMPACT_ASSEMBLER = 48,
#EXPRESS_BELT = 49,
#EXPRESS_BELT_RIGHT = 50,
#EXPRESS_BELT_LEFT = 51,
#EXPRESS_BELT_BRIDGE = 52,
#EXPRESS_BELT_BRIDGE_LEFT = 53,
#EXPRESS_BELT_BRIDGE_RIGHT = 54,
#PROSPERITY_BEACON = 55,
#SOLAR_GARDEN = 56,
#TELEPORT_BEACON = 57,
#OILWORKS = 58,
#MANA_LANTERN = 59,
#TRANS_DEPOT = 60,
#ESSENCE_FURNACE = 61,
#PLATFORM = 62,
#MOD_BUILDING_1..10 = 1000..1009

# Enum IDs for all resources:

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
#COPPER_ORE = 19,  # phase 2
#TIN_ORE = 20,  # phase 2
#STEEL_INGOT = 21,  # phase 2
#COPPER_INGOT = 22,  # phase 2
#TIN_INGOT = 23,  # phase 2
#BRONZE_INGOT = 24,  # phase 2
#LIMESTONE = 25,  # phase 2
#SILVER_ORE = 26,  # phase 2
#SILVER_INGOT = 27,  # phase 2
#MITHRIL_ORE = 28,  # phase 3
#MITHRIL_INGOT = 29,  # phase 3
#CRYSTAL_ORE = 30,  # phase 3
#CRYSTAL_INGOT = 31,  # phase 3
#ADAMANTINE_ORE = 32,  # phase 3
#ADAMANTINE_INGOT = 33,  # phase 3
#VOIDSTONE_ORE = 34,  # phase 3
#VOIDSTEEL_INGOT = 35,  # phase 3
#STARFALL_ORE = 36,  # phase 3
#STARSTEEL_INGOT = 37,  # phase 3
#ELECTRUM_INGOT = 38,  # phase 2
#MITHRIL_ALLOY = 39,  # phase 3
#ETHEREAL_STEEL = 40,  # phase 3
#SLAG = 41,  # phase 2
#FLUX = 42,  # phase 2
#METAL_DUST = 43,  # phase 3
#CRYSTAL_POWDER = 44,  # phase 3
#RUNESTONE = 45,  # phase 3
#ENCHANTED_STEEL = 46,  # phase 3
#PURE_ESSENCE = 47,  # phase 3
#GOLD_COMPONENT = 48,  # phase 1
#CRYSTALLIZED_COAL = 49,  # phase 2
#CRYSTAL_KEY = 50,  # phase 3
#WATER = 51,  # phase 2
#BRONZE_CASING = 52,  # phase 2
#DURABLE_HOUSING = 53,  # phase 2
#REINFORCED_PLATING = 54,  # phase 2
#FORTRESS_MACHINERY = 55,  # phase 2
#BLESSED_CONDUIT = 56,  # phase 2
#HARMONIC_RESONATOR = 57,  # phase 2
#SANCTIFIED_CORE = 58,  # phase 2
#PURIFIED_SOLVENT = 59,  # phase 2
#REFINED_FUEL = 60,  # phase 2
#CONCENTRATED_ENERGY = 61,  # phase 2
#BRONZE_KEY = 62,  # phase 2
#HARMONIC_KEY = 63,  # phase 2
#ARCHITECT_BANE = 64,  # phase 2
#WARD_BREAKER = 65,  # phase 2
#REALITY_REND = 66,  # phase 2
#OIL = 67,  # phase 2
#CRYSTAL_WIRE = 68,  # phase 3
#ADAMANTINE_COMPONENT = 69,  # phase 3
#DIMENSIONAL_COMPONENT = 70,  # phase 3
#HYBRID_MATRIX = 71,  # phase 3
#CRYSTAL_ASSEMBLY = 72,  # phase 3
#TITAN_ASSEMBLY = 73,  # phase 3
#DIMENSIONAL_CONVERGENCE = 74,  # phase 3
#RUNIC_PLATING = 75,  # phase 3
#REFINED_AMALGAM = 76,  # phase 3
#ESSENCE_WASH = 77,  # phase 3
#VOID_KEY = 78,  # phase 3
#VOID_SPLITTER = 79,  # phase 3
#STAR_RENDER = 80,  # phase 3
#LEGION_ANNIHILATOR = 81,  # phase 3
#COPPER_WIRE = 82,  # phase 2
#STEEL_PLATE = 83,  # phase 2
#VOID_CUBES = 84,  # phase 3
#STELLAR_FUEL = 85,  # phase 3
#STEEL_COMPONENT = 86,  # phase 2
#ULTRA_COMPONENT = 87,  # phase 2
#GEODE = 88,  # phase 2
#VOID_COMPONENT = 89,  # phase 3
#VOID_CHAMBER = 90,  # phase 3
#STELLAR_COMPONENT = 91,  # phase 3
#RESONANT_CORE = 92,  # phase 3
#STELLAR_ASSEMBLY = 93,  # phase 3
#MITHRIL_COMPONENT = 94,  # phase 3
#ENHANCED_CORE = 95,  # phase 3
#ETHEREAL_ASSEMBLY = 96,  # phase 3
#RUNIC_MATRIX = 97,  # phase 3
#STAR_CORE = 98,  # phase 3
#QUANTUM_SYSTEM = 99,  # phase 3
#CELESTIAL_SYSTEM = 100,  # phase 3
#STAR_SYSTEM = 101,  # phase 3
#CELESTIAL_MATRIX = 102,  # phase 3
#ETERNAL_ASSEMBLY = 103,  # phase 3
#COSMIC_ASSEMBLY = 104,  # phase 3
#RADIANT_ASSEMBLY = 105,  # phase 3
#LEGION_FRAME = 106,  # phase 3
#LEGION_CORE = 107,  # phase 3
#LEGION_MATRIX = 108,  # phase 3
#MOD_RESOURCE_1..10 = 1000..1009
