extends Node

export (PackedScene) var Obstacle

var score = 0


func _ready():
	randomize()
	$StartTimer.start()
	
	
func generateObstacle():
	$GeneratorPath/ObstacleSpawnLocation.offset = randi()
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position = $GeneratorPath/ObstacleSpawnLocation.position
	
	
func newGame():
	generateObstacle()
	$GeneratorTimer.start()
	$ScoreTimer.start()
	$Player.start()


func gameOver():
	$GeneratorTimer.stop()
	$ScoreTimer.stop()
	$Player/Timer.stop()
	get_tree().call_group("Obstacles","stopMoving")
	

func _on_GeneratorTimer_timeout():
	generateObstacle()


func _on_ScoreTimer_timeout():
	score += 1


func _on_StartTimer_timeout():
	newGame()
