extends Resource
class_name ModKitResourceData

@export var id: String = ""  # unique string
@export var display_name: String = ""  # in-game name
@export var stack_limit: int = 50  # storage limit per building etc.
@export var market_price: int = 1  # how many Credits you get for this at the Market
@export var accepted_by: Array[int] = []  # which buildings (by Enum) should be able to accept this building (logistics buildings like belts, and warehouses, will always accept everything, without having to be declared here)
@export var icon: Texture2D = null  # DO NOT SET THIS. INSTEAD: put your icon into assets/icons/, with the name [id]_icon.png, where id is the unique string you set above; filepath to the resource icon (128x128 .png).
@export var mesh: Resource = null  # DO NOT SET THIS. INSTEAD: put your mesh into assets/meshes/, with the name [id].res, where id is the unique string you set above. Filepath to the resource mesh (.res; don't make it too big in scale; for context: Ore is a sphere of radius 0.4 and height 0.8, converted into a half-sphere).
@export_multiline var description: String = ""  # description/flavor text/purpose of resource; for now not used in-game

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
