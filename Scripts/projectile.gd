class_name projectile
extends Node2D

@export var damage:= 1
signal player_damage(damage)




func _on_projectilehitbox_area_entered(area):
	if area.is_in_group("Player"):
		player_damage.emit(damage)
