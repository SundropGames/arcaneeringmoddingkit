extends Resource
class_name ModKitRecipe

@export var id: String = ""  # unique string (include the lowercase name of the building, e.g., "smelter", for recipes meant for Smelters
@export var display_name: String = ""  # in-game name
@export var inputs: Dictionary[int, int] = {}  # inputs for one turnover, in the form of {1:2}, which would be 2 units of the resource with Enum value of 1 (Ore)
@export var outputs: Dictionary[int, int] = {}  # outputs for one turnover, in the form of {1:2}, which would be 2 units of the resource with Enum value of 1 (Ore)
@export var production_time: float = 5.0  # how many seconds should one production cycle take
@export var energy_consumption: int = 5  # how much energy does this recipe consume extra
@export var required_research: String = ""  # which research ID does unlock this recipe
@export var byproducts: Dictionary[int, float] = {}  # whether there are possible byproducts for this recipe, in the form of {1: 0.2}, which would be a 20% chance of producing Ore as a byproduct
@export var mana_consumption: float = 0.0  # how much Mana per production cycle does this recipe consume extra
