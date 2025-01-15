class_name player_stats
extends Resource

signal player_health_changed

@export var max_health :int = 10;
@export var current_health :int = 10;
@export var money :int = 10
@export var goober :int = 10

func take_damage(damage:int) -> void:
	if damage<0:
		return
	current_health -= damage
	
	GlobalSignals.player_health_changed.emit()
	
	print("health after damage: " + str(current_health))

func heal(heal:int) -> void:
	if heal<0:
		return
	current_health += heal
