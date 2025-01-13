extends CharacterBody2D
@onready var projectile: CharacterBody2D = $"."
@export var stats : projectile_stats

func _ready() -> void:
	#doesn't set texure if resource texture is empty
	if not $Sprite2D.texture:
		$Sprite2D.texture = stats.texture

func _physics_process(delta: float) -> void:
	velocity = stats.direction.normalized() * stats.speed
	projectile.global_position += velocity
	move_and_slide()


#need to do area_shape_entered, not just area_entered
func _on_projectile_hitbox_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("You got hit")
	if area.is_in_group("Player"):
		#isn't actually doing anything right now because we haven't finished bus (also it's not linked)
		GlobalSignals.player_damaged.emit(stats.damage)
		
	queue_free()
