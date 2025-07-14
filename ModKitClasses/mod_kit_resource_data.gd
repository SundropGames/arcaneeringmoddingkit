extends Resource
class_name ModKitResourceData

@export var id: String = ""
@export var display_name: String = ""
@export var stack_limit: int = 50
@export var market_price: int = 1
@export var accepted_by: Array[int] = []
@export var icon: Texture2D = null
@export var mesh: Resource = null
@export_multiline var description: String = ""
