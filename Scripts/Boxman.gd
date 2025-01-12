extends CharacterBody2D
@onready var boxman: Node2D = $"."

var SPEED = 130;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func wsadMvmt() -> void:
	var deltaVector = Vector2(0,0)
	
	#summing direction vectors
	var xDirection := Input.get_axis("Move Left", "Move Right")
	var yDirection := Input.get_axis("Move Forward", "Move Backward")
	
	var holdKey = false
	if xDirection:
		deltaVector.x = xDirection
		holdKey = true
	if yDirection:
		deltaVector.y = yDirection
		holdKey = true
	if holdKey:
		velocity = SPEED * deltaVector.normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	#doing actual movement
	boxman.global_position += deltaVector.normalized() * SPEED;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	wsadMvmt()
	move_and_slide()#important for collisiions
