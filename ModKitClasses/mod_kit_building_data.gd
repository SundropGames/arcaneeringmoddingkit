extends Resource
class_name ModKitBuildingData

@export var id: String = ""  # unique string; also the asset naming prefix
@export var display_name: String = ""  # in-game name
@export var base_building: int = 4  # Enum value of the existing building whose scene & behaviour this reuses (4 = Smelter). See the building enum list below
@export var cost: int = 100  # Credit cost to place
@export var power_consumption: int = 0  # Electricity drawn while running
@export var mana_consumption: float = 0.0  # Mana drawn while running
@export var size: Vector2i = Vector2i(1, 1)  # Grid footprint
@export var height: float = 2.0  # Visual height, used for tooltips and elevated placement checks
@export var required_research: String = ""  # Research ID that unlocks this building; "" = available from start
@export_multiline var description: String = ""  # Shown in the build menu and the building panel
@export var category: int = 1  # Build-menu category (0: NONE, 1: PRODUCTION, 2: ENERGY, 3: LOGISTICS, 4: SPECIAL, 5: OTHER, 6: BLUEPRINTS, 7: DECORATIVE)
@export var can_receive: bool = true  # Whether belts can feed into it
@export var can_produce: bool = true  # Whether it can push items out
@export var accepted_by: Array[int] = []  # Resource Enum values this building accepts as input; leave empty to inherit the base building's list
@export var icon: Texture2D = null  # DO NOT SET THIS. INSTEAD: put your icon into assets/icons/, named [id]_icon.png. Optional; generated from the mesh if absent
@export var mesh: Resource = null  # DO NOT SET THIS. INSTEAD: put your mesh into assets/meshes/, named [id].res. Optional; the base building's mesh is used if absent

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
