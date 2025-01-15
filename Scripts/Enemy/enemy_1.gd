extends Enemy

@export var stats: enemy_stats = load("res://Resources/enemy_1.tres").create_instance()
@onready var art = $Sprite2D

func _ready() ->void:
	if not art.texture:
		art.texture = stats.texture
func attack():
	pass

func _physics_process(delta: float) -> void:
	pass
	
