extends CharacterBody3D


const SPEED = 80.0

@onready var character_body_3d: CharacterBody3D = $"."

func manageMvmt() -> void:
	var mvmtPressed = false
	if Input.is_action_pressed("w"):
		velocity.z = -SPEED
		rotate_y(PI - character_body_3d.rotation.y)
		mvmtPressed = true
	if Input.is_action_pressed("d"):
		velocity.x = SPEED
		rotate_y(PI/2 - character_body_3d.rotation.y)
		mvmtPressed = true
	if Input.is_action_pressed("s"):
		velocity.z = SPEED
		rotate_y(-character_body_3d.rotation.y)
		mvmtPressed = true
	if Input.is_action_pressed("a"):
		velocity.x = -SPEED
		rotate_y(3*PI/2 - character_body_3d.rotation.y)
		mvmtPressed = true
		
	if not mvmtPressed:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	manageMvmt()

	move_and_slide()
