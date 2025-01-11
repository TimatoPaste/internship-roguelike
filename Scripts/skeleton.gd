extends CharacterBody3D


const SPEED = 80.0

@onready var character_body_3d: CharacterBody3D = $"."

func manageMvmt() -> void:
	var wsPressed = false
	var adPressed = false
	if Input.is_action_pressed("w"):
		velocity.z = -SPEED
		look_at(character_body_3d.position+Vector3(0, 0, 1),Vector3(0, 1, 0))
		wsPressed = true
	if Input.is_action_pressed("d"):
		velocity.x = SPEED
		look_at(character_body_3d.position+Vector3(-1, 0, 0),Vector3(0, 1, 0))
		adPressed = true
	if Input.is_action_pressed("s"):
		velocity.z = SPEED
		look_at(character_body_3d.position+Vector3(0, 0, -1),Vector3(0, 1, 0))
		wsPressed = true
	if Input.is_action_pressed("a"):
		velocity.x = -SPEED
		look_at(character_body_3d.position+Vector3(1, 0, 0),Vector3(0, 1, 0))
		adPressed = true
		
	if not adPressed:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not wsPressed:
		velocity.z = move_toward(velocity.z, 0, SPEED)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	manageMvmt()

	move_and_slide()
