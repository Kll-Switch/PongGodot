extends RigidBody2D

@export var start_speed := 550.0
@export var speed_increase := 20.0
@export var angle_variation := 0.5

var current_speed := 0.0

func _ready():
	current_speed = start_speed

	var dir = Vector2(
		[-1, 1].pick_random(),
		randf_range(-0.5, 0.5)
	).normalized()

	linear_velocity = dir * current_speed


func _integrate_forces(state):
	if state.get_contact_count() > 0:

		current_speed += speed_increase

		# Add slight random tilt
		var dir = linear_velocity.normalized()
		dir.y += randf_range(-angle_variation, angle_variation)

		# Prevent perfectly horizontal movement
		if abs(dir.y) < 0.1:
			dir.y = 0.1 * sign(randf_range(-1, 1))

		dir = dir.normalized()

		linear_velocity = dir * current_speed
