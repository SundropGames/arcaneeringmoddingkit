extends Resource
class_name ModKitRecipe

@export var id: String = ""  # unique string (include the lowercase name of the building, e.g., "smelter", for recipes meant for Smelters
@export var display_name: String = ""  # in-game name
@export var inputs: Dictionary[int, int] = {}  # inputs for one turnover, in the form of {1:2}, which would be 2 units of the resource with Enum value of 1 (Ore)
@export var outputs: Dictionary[int, int] = {}  # outputs for one turnover, in the form of {1:2}, which would be 2 units of the resource with Enum value of 1 (Ore)
@export var production_time: float = 5.0  # how many seconds should one production cycle take
@export var energy_consumption: int = 5  # how much energy does this recipe consume extra
@export var required_research: String = ""  # which research ID unlocks this recipe
@export var byproducts: Dictionary[int, float] = {}  # whether there are possible byproducts for this recipe, in the form of {1: 0.2}, which would be a 20% chance of producing Ore as a byproduct
@export var mana_consumption: float = 0.0  # how much Mana per production cycle does this recipe consume extra
@export var heat_production: float = 0.0  # How much heat is produced per crafting cycle (0-100) [Note: anything intended to be used pre-Act II should keep this at 0]
@export var xp_reward: int = 1  # How much XP to award the building for each crafting cycle

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
