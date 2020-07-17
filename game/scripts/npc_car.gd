extends StaticBody2D

var speed
const MAX_SPEED = 300
const MIN_SPEED = 200

func _ready():
	speed = randi() % (MAX_SPEED - MIN_SPEED) + MIN_SPEED


func _process(delta):
	position.y -= speed * delta
