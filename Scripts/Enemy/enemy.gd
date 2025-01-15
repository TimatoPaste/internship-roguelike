class_name Enemy
extends CharacterBody2D

func attack():
	pass

func movement():
	pass

func _on_death():
	queue_free()
