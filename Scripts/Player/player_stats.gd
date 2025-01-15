class_name player_stats
extends Resource
@export var max_health :int = 10;
@export var current_health :int = 10;

func take_damage(damage:int) -> void:
	if damage<0:
		return
	current_health -= damage

func heal(heal:int) -> void:
	current_health += heal
