class_name HurtBox
extends Area2D

signal damage_taken(damage)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	damage_taken.emit(1)
	print("HEEEY")
