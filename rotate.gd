extends Spatial

const MODE_DIRECT = 0
const MODE_CONSTANT = 1
const MODE_SMOOTH = 2

const ROTATION_SPEED = 1
const SMOOTH_SPEED = 2.0

export(int, "Direct", "Constant", "Smooth") var mode = MODE_DIRECT

var direction = Vector3.FORWARD

func _physics_process(delta):
	if (Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_down")):
		direction = Vector3(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
							0,
							Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()

	if mode == MODE_DIRECT:
		rotation.y = atan2(-direction.x, -direction.z)
		
	elif mode == MODE_CONSTANT:
		var front = transform.basis.z
		var ang = Vector2(front.x, front.z).angle_to(Vector2(direction.x, direction.z))
		var s = sign(ang)
		
		if(rad2deg(ang) <= 179): # Creating a threshold otherwise there is a slight vibration
			rotate_y(ROTATION_SPEED*delta*s)
			
	elif mode == SMOOTH_SPEED:
		rotation.y = lerp_angle(rotation.y, atan2(-direction.x, -direction.z), delta * SMOOTH_SPEED)
