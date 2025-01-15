extends CharacterBody2D

@onready var player: Node2D = $"."
@export var player_stats: Resource
var SPEED = 130;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect("player_damaged",_on_player_damaged)
	

func wsadMvmt() -> void:
	var directionVector = Vector2(0,0)
	
	#summing direction vectors
	var xDirection := Input.get_axis("Move Left", "Move Right")
	var yDirection := Input.get_axis("Move Forward", "Move Backward")
	
	var holdKey = false
	if xDirection:
		directionVector.x = xDirection
		holdKey = true
	if yDirection:
		directionVector.y = yDirection
		holdKey = true
	if holdKey:
		velocity = SPEED * directionVector.normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	#doing actual movement
	player.global_position += velocity;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	wsadMvmt()
	move_and_slide()#important for collisiions


func _on_player_damaged(damage):
	player_stats.take_damage(damage)
	print("took " + str(damage) + " damage")
