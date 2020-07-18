extends Node2D

signal hit

const SPEED = Vector2(600,400)
const MIN_RANDOM_MOVE = 100
const MAX_RANDOM_MOVE = 200 

var vel = Vector2()
var screen_size = Vector2()
var random_move = 0
var emitted = false

func _ready():
	screen_size = get_viewport_rect().size
	random_move = randi() % (MAX_RANDOM_MOVE - MIN_RANDOM_MOVE) + MIN_RANDOM_MOVE
	vel.y = -SPEED.y
	


func _physics_process(delta):
	if (!emitted):
		$PlayerCar.linear_velocity.x = (vel.x + random_move) * delta * 50
		$PlayerCar.linear_velocity.y = vel.y
	print ($PlayerCar.linear_velocity.x)
	var x = $PlayerCar.position.x
	if (x >= 288 || x <= -288):
		emit_signal("hit")
	
func start():
	$Timer.start()
	
	
func _input(e):
	if e is InputEventScreenTouch:
		if e.position.y >= screen_size.y/2:
			if e.position.x < screen_size.x/2:
				if e.pressed:
					vel.x = -SPEED.x + random_move
				else:
					vel.x = 0
			else:
				pass
				if e.pressed:
					vel.x = SPEED.x + random_move
				else:
					vel.x = 0


func _on_Timer_timeout():
	random_move = randi() % (MAX_RANDOM_MOVE - MIN_RANDOM_MOVE) + MIN_RANDOM_MOVE
	if !(randi() % 2):
		random_move *= -1


func _on_PlayerCar_body_entered(body):
	emit_signal("hit")
	$Timer.stop()
	vel.x += random_move
	random_move = 0
	
	emitted = true
	$PlayerCar/CollisionShape2D.set_deferred("disabled", true)
