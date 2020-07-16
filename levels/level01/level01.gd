extends Node

export (PackedScene) var Obstacle

var score = 0


func _ready():
	randomize()
	
	
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
	#$GeneratorTimer.stop()
	#$ScoreTimer.stop()
	#$Player/Timer.stop()
	get_tree().paused = true
	

func _on_GeneratorTimer_timeout():
	generateObstacle()


func _on_ScoreTimer_timeout():
	score += 1
	$CanvasLayer/Score.text = ("%s" %  str(score))


func _on_Player_hit():
	stopLevel() # Replace with function body.
