extends Area2D

signal hit

const SPEED = Vector2(600,400)
const MIN_RANDOM_MOVE = 100
const MAX_RANDOM_MOVE = 400 

var velx = 0
var screen_size = Vector2()
var random_move = 0

func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	position.x += (velx+random_move) * delta
	position.y -= SPEED.y * delta
	

func start():
	random_move = randi() % (MAX_RANDOM_MOVE - MIN_RANDOM_MOVE) + MIN_RANDOM_MOVE
	$Timer.start()
	
	
func _input(e):
	if e is InputEventScreenTouch:
		if e.position.y >= screen_size.y/2:
			if e.position.x < screen_size.x/2:
				if e.pressed:
					velx = SPEED.x * -1
				else:
					velx = 0
			else:
				if e.pressed:
					velx = SPEED.x
				else:
					velx = 0


func _on_Timer_timeout():
	random_move = randi() % (MAX_RANDOM_MOVE - MIN_RANDOM_MOVE) + MIN_RANDOM_MOVE
	if !(randi() % 2):
		random_move *= -1


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	
