extends Node


var score = 0
var car_script
var car_model

func _ready():
	car_script = preload("res://scripts/npc_car.gd")
	car_model = preload("res://models/cars/car.tscn")
	randomize()
	
func _process(delta):
	var x = $Player.position.x
	if (x >= 576 || x <= 0):
		$Player.emit_signal("hit")
	
func generateObstacle():
	
	$GeneratorPath/ObstacleSpawnLocation.offset = randi()
	var car = car_model.instance()
	car.set_script(car_script)
	add_child(car)
	car.position.x = $GeneratorPath/ObstacleSpawnLocation.position.x
	car.position.y = $Player.position.y - 1024
	
	
	
func startLevel():
	generateObstacle()
	$GeneratorTimer.start()
	$ScoreTimer.start()
	$Player.start()


func stopLevel():
	$CanvasLayer/RestartButton.show()
	get_tree().paused = true
	

func _on_GeneratorTimer_timeout():
	generateObstacle()


func _on_ScoreTimer_timeout():
	score += 1
	$CanvasLayer/Score.text = ("%s" %  str(score))


func _on_Player_hit():
	stopLevel() # Replace with function body.


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	$CanvasLayer/RestartButton.hide()
	get_tree().paused = false
	
