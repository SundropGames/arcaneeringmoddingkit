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
