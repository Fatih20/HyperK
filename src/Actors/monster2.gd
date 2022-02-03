extends Actor

var is_right = 1

func _physics_process(_delta: float) -> void:
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
func get_direction() -> Vector2:
	if is_on_wall():
		is_right = 1 - is_right
	if is_right:
		return Vector2(1, 0)
	else:
		return Vector2(-1, 0)

func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y += speed.y * direction.y
	return new_velocity
