extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEEDX = 600
const MIN_RANDOM_MOVE = 200
const MAX_RANDOM_MOVE = 500 
var velx = 0
var screen_size = Vector2()
var random_move = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	randomize()
	random_move = randi() % (MAX_RANDOM_MOVE - MIN_RANDOM_MOVE) + MIN_RANDOM_MOVE
	$Timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += (velx-random_move) * delta
	
	
func _input(e):
	if e is InputEventScreenTouch:
		if e.position.y >= screen_size.y/2:
			if e.position.x < screen_size.x/2:
				if e.pressed:
					velx = SPEEDX * -1
				else:
					velx = 0
			else:
				if e.pressed:
					velx = SPEEDX
				else:
					velx = 0


func _on_Timer_timeout():
	random_move = randi() % (MAX_RANDOM_MOVE - MIN_RANDOM_MOVE) + MIN_RANDOM_MOVE
	if !(randi() % 2):
		random_move *= -1
	$Timer.start()
