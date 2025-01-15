class_name enemy_stats
extends Resource

@export var texture: Texture2D
@export var xScale: float
@export var yScale: float

@export var max_health: int
@export var current_health: int
@export var damage: int

func take_damage(damage:int) -> void:
	if damage<0:
		return
	current_health -= damage

func heal(heal:int) -> void:
	current_health += heal

func create_instance() -> Resource:
	var instance: enemy_stats = self.duplicate()
	instance.max_health = max_health
	instance.current_health = current_health
	instance.damage = damage
	return instance
