extends Node


func _ready():
	$StartTimer.start()


func _on_StartTimer_timeout():
	$Level01.startLevel()
