extends RigidBody2D


const MAX_VEL = 300
const MIN_VEL = 200

func _ready():
	linear_velocity.y = randi() % (MAX_VEL - MIN_VEL) + MIN_VEL * -1
