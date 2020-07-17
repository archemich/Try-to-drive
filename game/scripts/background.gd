extends ParallaxBackground

var backgrounds = []
var which_background = false


func _ready():
	backgrounds.append(get_node("Background1"))
	backgrounds.append(get_node("Background2"))
	

func _process(delta):
	if (!which_background):
		var temp = backgrounds[1].get_position()
		if($"/root/Player".position.y <= temp.y + 100):
			temp.y += 1024
			backgrounds[0].set_position(temp)
	else:
		var temp = backgrounds[0].get_position()
		if ($"/root/Player".position.y <= temp.y + 100):
			temp.y += 1024
			backgrounds[1].set_position(temp)
