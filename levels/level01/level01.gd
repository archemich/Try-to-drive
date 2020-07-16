extends Node

export (PackedScene) var Obstacle

var score = 0


func _ready():
	randomize()
	
func _process(delta):
	var x = $Player.position.x
	if (x >= 576 || x <= 0):
		$Player.emit_signal("hit")
	
func generateObstacle():
	$GeneratorPath/ObstacleSpawnLocation.offset = randi()
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position.x = $GeneratorPath/ObstacleSpawnLocation.position.x
	obstacle.position.y = $Player.position.y - 1024
	
	
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
	
