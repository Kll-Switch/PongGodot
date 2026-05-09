extends CharacterBody2D

const SPEED = 550.0

func _physics_process(delta):
	var direction = Input.get_axis("player_2_left", "player_2_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	move_and_slide()
